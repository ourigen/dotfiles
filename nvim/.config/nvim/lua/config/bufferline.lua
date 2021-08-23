require('bufferline').setup {
	options = {
		mappings = false,
		indicator_icon = '▎',
		modified_icon = '',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 25,
		tab_size = 30,
		diagnostics = false,
		separator_style = 'slant',
		offsets = {
			{
				filetype = "NvimTree",
				text = " File Explorer",
				-- highlight = "Directory",
				highlight = "NvimTreeNormal",
				text_align = "center"
			}
		}
	},
	highlights = {
		fill = {
			guibg = {
				attribute = "bg",
				highlight = "StatusLine"
			}
		},
		separator_selected = {
			guifg = {
				attribute = "bg",
				highlight = "StatusLine"
			}
		},
		separator_visible = {
			guifg = {
				attribute = "bg",
				highlight = "StatusLine"
			}
		},
		separator = {
			guifg = {
				attribute = "bg",
				highlight = "StatusLine"
			}
		},
		buffer_selected = {
			gui = ""
		}
	}
}
