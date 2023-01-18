-- colorscheme
local tokyonight = require("tokyonight")
tokyonight.setup({})
vim.cmd([[colorscheme tokyonight]])

-- lualine
require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
})
