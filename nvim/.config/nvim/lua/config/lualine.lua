require('lualine').setup{
	options = {
		icons_enabled = true,
		component_separators = {'', ''},
		section_separators = {'', ''},
		theme = 'tokyonight',
		disabled_filetypes = { 'qf', 'NvimTree', 'Trouble', 'vim-plug' }
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {
			{
				'branch',
				icon = '',
			}
		},
		lualine_c = {
			{
				'filename',
				file_status = true,
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
				symbols = {modified = ' ', readonly = ' '},
				separator = ''
			},
			{
				'diagnostics',
				sources = {'nvim_lsp'},
				sections = {'error', 'warn', 'info'},
				-- symbols = { error = " ", warn = " ", info = " " }
				symbols = { error = " ", warn = " ", info = " " }
			},
		},
		lualine_x = {'encoding', {'fileformat', icons_enabled = false}, 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
}
