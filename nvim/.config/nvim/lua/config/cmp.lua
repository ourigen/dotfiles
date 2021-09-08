local luasnip = require('luasnip')
local cmp = require('cmp')

local M = {}
M.icons = {
	Class = "ﴯ",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "ﰠ",
	File = "",
	Folder = "",
	Function = "",
	Interface = "",
	Keyword = "",
	Method = "",
	Module = "",
	Operator = "",
	Property = "ﰠ",
	Reference = "",
	Snippet = "",
	Struct = "",
	Text = "",
	TypeParameter = "",
	Unit = "",
	Value = "",
	Variable = "",
}

cmp.setup {

	documentation = {
		border = { '', '', '', ' ', '', '', '', ' ' },
		winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
	},

	event = {},

	-- lspkind
	formatting = {
		format = function(entry, vim_item)
			-- local lspkind = require('lspkind')
			-- vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind
			-- Add completion type in text in addition to icon
			vim_item.kind = M.icons[vim_item.kind] .. ' ' .. vim_item.kind
			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				buffer = '[Buffer]',
				path = '[Path]',
				luasnip = '[LuaSnip]',
			})[entry.source.name]
			return vim_item
		end
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},

		-- luasnip
		['<Tab>'] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if vim.fn.pumvisible() == 1 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
			else
				fallback()
			end
		end,
	},

	sources = {
		{ name = 'buffer',
			-- opts = {
			-- 	-- show only visible buffers
			-- 	get_bufnrs = function()
			-- 		return vim.tbl_filter(function(bufnr)
			-- 			return vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr)
			-- 		end, vim.api.nvim_list_bufs())
			-- 	end
			-- }
		},
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'orgmode' }
	},

}
