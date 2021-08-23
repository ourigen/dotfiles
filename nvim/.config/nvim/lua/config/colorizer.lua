require 'colorizer'.setup({
	'vim';
	'lua' ; -- Disable parsing "names" like Blue or Gray
	'html'; -- Disable parsing "names" like Blue or Gray
	css = { css = true; }; -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	'conf';
	'yaml';
},
-- Global settings
{
	RGB      = false;         -- #RGB hex codes
	RRGGBBAA = true;          -- #RRGGBBAA hex codes
	names    = false;         -- "Name" codes like Blue
}
)
