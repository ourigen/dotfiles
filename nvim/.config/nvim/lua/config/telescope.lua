require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				-- exit on <Esc>
				["<esc>"] = require('telescope.actions').close
			},
		},
		prompt_prefix = "› ",
		selection_caret = "› ",
		file_ignore_patterns = {".git", "~/.local/share/Trash*"},
		border                  = {},
		borderchars             = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		}
	}
}
require('telescope').load_extension('fzf')
