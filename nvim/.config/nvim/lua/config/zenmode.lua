require("zen-mode").setup {
	window = {
		backdrop = 1,
		height = 0.95,
		options = {
			signcolumn = "no",
			number = false,
			relativenumber = false,
			cursorline = true,
			cursorcolumn = false,
			foldcolumn = "0", -- disable fold column
			list = false, -- disable listchars
		},
	},
}
