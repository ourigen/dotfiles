require("luasnip.loaders.from_vscode").lazy_load({
	paths = {
		vim.fn.stdpath("data") .. "/site/pack/packer/start/friendly-snippets"
	}
})

require("luasnip").config.set_config({
	enable_autosnippets = true,
	history = true, -- snippets that were exited can still be jumped back into
	updateevents = "TextChanged,TextChangedI",  -- trigger an update of the active nodes' dependents
	region_check_events = "CursorHold", -- when to leave the current snippet if the cursor is outside its region
	delete_check_events = 'TextChanged', -- when to check if the current snippet was deleted and remove it from the history
	store_selection_keys = "<Tab>", -- mapping for populating TM_SELECTED_TEXT and related variables
})
