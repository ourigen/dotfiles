require('bufferline').setup {
	options = {
		indicator_icon = '▎',
		close_icon = '',
		modified_icon = 'ﱣ',
		left_trunc_marker = '',
		right_trunc_marker = '',
		-- show_buffer_icons = false,
		max_name_length = 25,
		tab_size = 30,
		diagnostics = false,
		separator_style = 'thin',
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
