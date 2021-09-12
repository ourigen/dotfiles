-- require('lualine').setup{
-- 	options = {
-- 		icons_enabled = true,
-- 		component_separators = {'', ''},
-- 		section_separators = {'', ''},
-- 		disabled_filetypes = { 'qf', 'NvimTree', 'Trouble' },
-- 		theme = 'tokyonight',
-- 	},
-- 	sections = {
-- 		lualine_a = {'mode'},
-- 		lualine_b = { { 'branch', icon = '', } },
-- 		lualine_c = {
-- 			{ 'filename',
-- 				file_status = true,
-- 				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
-- 				symbols = {modified = ' ', readonly = ' '},
-- 				separator = ''
-- 			},
-- 			{ 'diff',
-- 				symbols = { added    = " ", modified = " ", removed  = " " },
-- 				colored = true,
-- 				color_added    = "#9ece6a",
-- 				color_modified = "#e0af68",
-- 				color_removed  = "#f7768e",
-- 				condition = function()
-- 					return vim.fn.winwidth(0) > 120
-- 				end,
-- 			},
-- 			{ 'diagnostics',
-- 				sources = {'nvim_lsp'},
-- 				sections = {'error', 'warn', 'info'},
-- 				symbols = { error = " ", warn = " ", info = " " }
-- 			},
-- 		},
-- 		lualine_x = {'encoding', {'fileformat', icons_enabled = false}, 'filetype'},
-- 		lualine_y = {'progress'},
-- 		lualine_z = {'location'}
-- 	},
-- 	inactive_sections = {
-- 		lualine_a = {},
-- 		lualine_b = {},
-- 		lualine_c = {'filename'},
-- 		lualine_x = {'location'},
-- 		lualine_y = {},
-- 		lualine_z = {}
-- 	},
-- 	tabline = {},
-- }

-- DOOM MODELINE
local lualine = require('lualine')
local colors = require("tokyonight.colors").setup()

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand('%:p:h')
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		theme = {
			-- We are going to use lualine_c and lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg_statusline } },
			inactive = {
				a = { bg = colors.bg_statusline, fg = colors.blue },
				b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
				c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
			}

		},
		disabled_filetypes = { 'qf', 'NvimTree', 'Trouble' },
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	-- TODO: Fix inactive
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left {
	function() return '▎' end,
	color = {fg = colors.blue}, -- Sets highlighting of component
	left_padding = 0 -- We don't need space before this
}

ins_left {
	-- mode component
	function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.blue,
			i = colors.green,
			v = colors.magenta,
			[''] = colors.magenta,
			V = colors.magenta,
			c = colors.yellow,
			no = colors.blue,
			s = colors.red,
			S = colors.red,
			[''] = colors.red,
			ic = colors.green,
			R = colors.red,
			Rv = colors.red,
			cv = colors.yellow,
			ce = colors.yellow,
			r = colors.red,
			rm = colors.red,
			['r?'] = colors.red,
			['!'] = colors.red,
			t = colors.blue
		}
		vim.api.nvim_command('hi! LualineMode guifg='..mode_color[vim.fn.mode()] .. " guibg="..colors.bg_dark)
		return 'ﱣ'
	end,
	color = "LualineMode",
	left_padding = 0,

}

ins_left {
	-- filesize component
	function()
		local function format_file_size(file)
			local size = vim.fn.getfsize(file)
			if size <= 0 then return '' end
			local sufixes = {'b', 'k', 'm', 'g'}
			local i = 1
			while size > 1024 do
				size = size / 1024
				i = i + 1
			end
			return string.format('%.1f%s', size, sufixes[i])
		end
		local file = vim.fn.expand('%:p')
		if string.len(file) == 0 then return '' end
		return format_file_size(file)
	end,
	condition = conditions.buffer_not_empty,
	color = {fg = colors.fg},
}

ins_left {
	'filetype',
	format = function() return ' ' end,
	right_padding = 0,
}

ins_left {
	function()
		local dirname = vim.fn.expand('%:h')
		if dirname ~= '.' then return dirname .. '/' end
	end,
	condition = conditions.buffer_not_empty,
	color = {fg = colors.blue, gui = 'bold'},
	left_padding = 0,
	right_padding = 0
}

ins_left {
	'filename',
	condition = conditions.buffer_not_empty,
	path = 0,
	symbols = {modified = ' ', readonly = ' '},
	color = {fg = colors.fg, gui = 'bold'},
	left_padding = 0
}

ins_left {
	'location',
	color = {fg = colors.dark3}
}

ins_left {
	'progress',
	color = {fg = colors.dark3},
}

ins_right {
	'diagnostics',
	sources = {'nvim_lsp'},
	symbols = {error = ' ', warn = ' ', info= ' '},
	color_error = colors.red,
	color_warn = colors.yellow,
	color_info = colors.cyan,
}

ins_right {
	'diff',
	symbols = { added = " ", modified = " ", removed  = " " },
	color_added = colors.green,
	color_modified = colors.yellow,
	color_removed = colors.red,
	condition = conditions.hide_in_width,
	left_padding = 0,
}

ins_right {
	'fileformat',
	icons_enabled = false,
	color = { fg = colors.dark3 },
	condition = conditions.hide_in_width,
}

ins_right {
	'o:encoding', -- option component same as &encoding in viml
	upper = false, -- upper/lower case
	condition = conditions.hide_in_width,
	color = { fg = colors.dark3 }
}

ins_right {
	'branch',
	icon = '',
	condition = conditions.check_git_workspace,
	color = {fg = colors.yellow, gui = 'bold'},
	-- right_padding = 0
}

ins_right {
	-- Lsp server name .
	function ()
		local msg = ''
		local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then return msg end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = '',
	color = {fg = colors.magenta, gui = 'bold'},
	right_padding = 0
}

lualine.setup(config)
