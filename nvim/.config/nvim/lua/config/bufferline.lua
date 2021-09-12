require('bufferline').setup {
	options = {
		-- indicator_icon = '▎',
		indicator_icon = ' ',
		close_icon = '',
		modified_icon = 'ﱣ',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 20,
		tab_size = 25,
		diagnostics = false,
		show_close_icon = false,
		-- separator_style = 'slant',
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
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
