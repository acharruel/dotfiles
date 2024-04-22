# dotfiles

Configuration files for miscellaneous utilities

Prerequisite: stow (https://www.gnu.org/software/stow/) symlink farm manager

### cgdb (the curses debugger)

https://cgdb.github.io/

```
stow cgdb
```

### gtkwave ()

http://gtkwave.sourceforge.net/

```
stow gtkwave
```

### kanshi (autorandr wayland equivalent)

https://sr.ht/~emersion/kanshi/

```
stow kanshi
```

### kitty ( The fast, feature-rich, GPU based terminal emulator)

https://sw.kovidgoyal.net/kitty/

```
stow kitty
```

### mako (A lightweight notification daemon for Wayland)

https://github.com/emersion/mako

```
stow mako
```

### nnn (Nnn's Not Noice! File manager)

https://github.com/jarun/nnn

```
stow nnn
```

### poke (binary data editor)

https://www.gnu.org/software/poke/

```
stow poke
```

### rofi (window switcher application wayland compatible fork)

Use rofi wayland fork.
https://github.com/davatorium/rofi

Configs are from:
https://github.com/adi1090x/rofi.git

```
stow rofi
```

### sway (i3 compatible wayland compositor)

https://github.com/swaywm/sway

Requires swayfx for more fancyness!
https://github.com/WillPower3309/swayfx

For swaylock, use screenshot corrupter
https://github.com/r00tman/corrupter

```
stow sway
```

### neovim

https://neovim.io/

```
stow nvim
```

### udiskie

Automounter for removable media.
https://github.com/coldfix/udiskie

```
stow waybar
```

### waybar (customizable waylan bar)

https://github.com/Alexays/Waybar

```
stow waybar
```

### wireplumber

Extra configs for wireplumber pipewire session manager.

```
stow wireplumber
```

### yazi

Blazing fast terminal file manager written in Rust, based on async I/O.

```
stow yazi
```

### zathura

```
stow zathura
```

### zsh

https://www.zsh.org/

May be used with oh-my-zsh (https://ohmyz.sh/) or
zprezto (https://github.com/sorin-ionescu/prezto).

```
stow zsh
cd -
```

With prezto:
```
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

`.zshrc` customization:
```
# Customize to your needs...
export ZSHDIR="/home/adrien/.zsh"

source ${ZSHDIR}/zsh.config
source ${ZSHDIR}/zsh.bindkeys
source ${ZSHDIR}/zsh.alias
source ${ZSHDIR}/zsh.prompt
source ${ZSHDIR}/zshenv
source ${ZSHDIR}/zsh.nnn

# fzf
source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```

Install fzf:
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Misc.

* Graphite GTK theme:
https://github.com/vinceliuice/Graphite-gtk-theme

* Tela circle icon theme
https://github.com/vinceliuice/Tela-circle-icon-theme
