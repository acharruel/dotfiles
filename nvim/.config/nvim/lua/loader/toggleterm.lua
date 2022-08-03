local terminal = require("toggleterm.terminal").Terminal
local lazygit = terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function lazygit_toggle()
	lazygit:toggle()
end
