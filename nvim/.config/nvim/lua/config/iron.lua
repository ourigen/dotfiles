require('iron').core.set_config {
	repl_open_cmd = "botright 20 split"
}
vim.api.nvim_set_keymap("n", "<localleader>ii", "<Plug>(iron-send-line)", {})
vim.api.nvim_set_keymap("n", "si", "<Plug>(iron-send-motion)", {})
vim.api.nvim_set_keymap("v", "si", "<Plug>(iron-visual-send)", {})
