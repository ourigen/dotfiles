vim.g.tokyonight_colors = {
	border = 'bg',
	border_highlight = 'fg_gutter'
}

-- For some reason, calling colorscheme() has loading issues compared to vim.cmd
-- require("tokyonight").colorscheme()
vim.cmd[[colorscheme tokyonight]]
