P = function(v)
    print(vim.inspect(v))
    return v
end

RELOAD = function(...)
    return require("plenary.reload").reload_module(...)
end

R = function(name)
    RELOAD(name)
    return require(name)
end

LaunchBrowser = function()
    local filename = vim.api.nvim_buf_get_name(0)
    local html = filename.gsub(filename, ".md", ".html")
    if filename ~= html then
        os.execute("google-chrome \""..html.."\"".." 2> /dev/null")
    end
end
