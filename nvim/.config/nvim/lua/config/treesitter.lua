require'nvim-treesitter.configs'.setup {
	ensure_installed = { "r", "python", "lua", "html", "css", "bash", "comment" },
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
	indent = {
		enable = true
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
}

-- nvim-treesitter-refactor
-- require'nvim-treesitter.configs'.setup {
-- 	refactor = {
-- 		highlight_definitions = { enable = true },
-- 		highlight_current_scope = { enable = true },
-- 		smart_rename = {
-- 			enable = true,
-- 			keymaps = {
-- 				smart_rename = "grr",
-- 			},
-- 		},
-- 		navigation = {
-- 			enable = true,
-- 			keymaps = {
-- 				goto_definition_lsp_fallback = "gnd",
-- 				list_definitions = "gnD",
-- 				list_definitions_toc = "gO",
-- 				goto_next_usage = "<a-*>",
-- 				goto_previous_usage = "<a-#>",
-- 			},
-- 		},
-- 	},
-- }
