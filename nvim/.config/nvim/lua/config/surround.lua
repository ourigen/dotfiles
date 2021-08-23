require('surround').setup{
	mappings_style = 'surround',
	pairs = {
		nestable = {
			{"(", ")"}, 
			{"[", "]"},
			{"{", "}"}
		},
		linear = {
			{"'", "'"},
			{'"', '"'},
			{'*', '*'},
			{'_', '_'},
			{'/', '/'},
			{'=', '='},
			{'~', '~'},
			{'+', '+'},
		}
	},
	quotes = {"'", '"', '`'} 
}
