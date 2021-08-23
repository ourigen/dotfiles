require'tabline'.setup {
	-- Defaults configuration options
	enable = true,
	options = {
		-- If lualine is installed tabline will use separators configured in lualine by default.
		-- These options can be used to override those settings.
		component_separators = {'', ''},
		section_separators = {'', ''},
		max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
		always_show_tabs = false, -- by default, this shows tabs only when there are more than one tab or if the first tab is named
	}
}
