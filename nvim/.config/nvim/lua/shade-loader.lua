local status, shade = pcall(require, "shade")
if not status then
    return
end

shade.setup({
    overlay_opacity = 80,
    opacity_step = 1,
})
