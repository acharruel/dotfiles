set auto-load safe-path /
set print pretty
set output-radix 16
set disassemble-next-line on

# Display ARM64 current exception level
define arm64_get_current_el
    # Read CPSR.M[3:2] register
    # https://developer.arm.com/documentation/ddi0601/2025-03/AArch32-Registers/CPSR--Current-Program-Status-Register
    set $el = ($cpsr >> 2) & 0x3
    printf "CurrentEL=%d ", $el
    if $el == 0
        printf "User\n"
    end
    if $el == 1
        printf "Monitor\n"
    end
    if $el == 2
        printf "Hypervisor\n"
    end
    if $el == 3
        printf "System\n"
    end
end

define xac
    dont-repeat
    set $addr = (char *)($arg0)
    set $endaddr = $addr + $arg1
    while $addr < $endaddr
        printf "%p: ", $addr
        set $lineendaddr = $addr + 8
        if $lineendaddr > $endaddr
            set $lineendaddr = $endaddr
        end
        set $a = $addr
        while $a < $lineendaddr
            printf "0x%02x ", *(unsigned char *)$a
            set $a++
        end
        printf "'"
        set $a = $addr
        while $a < $lineendaddr
            printf "%c", *(char *)$a
            set $a++
        end
        printf "'\n"
        set $addr = $addr + 8
    end
end
