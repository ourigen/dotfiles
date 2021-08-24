require("luasnip.loaders.from_vscode").lazy_load({
	paths = {
		vim.fn.stdpath("data") .. "/site/pack/packer/start/friendly-snippets"
	}
})

require("luasnip").config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})
