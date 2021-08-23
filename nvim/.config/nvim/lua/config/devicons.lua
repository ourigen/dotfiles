require'nvim-web-devicons'.setup {
	-- globally enable default icons (default to false)
	default = true;
	override = {
		default_icon = {
			icon = "",
			color = "#6d8086",
			name = "Default",
		},
		zsh = {
			icon = "",
			color = "#428850",
			name = "zsh"
		},
		sh = {
			icon = "",
			color = "#428850",
			name = "sh"
		},
		html = {
			icon = "",
			color = "#3d59a1",
			name = "html"
		},
		css = {
			icon = "",
			name = "css",
			color = "#ff9e64"
		},
		js = {
			icon = "",
			name = "js",
			color = "#e0af68"
		},
		ts = {
			icon = "ﯤ",
			name = "ts",
			color = "#e0af68"
		},
		dockerfile = {
			icon = "",
			name = "Dockerfile",
			color = "#3d59a1",
		},
		rb = {
			icon = "",
			name = "rb",
			color = "#f7768e"
		},
		lock = {
			icon = "",
			name = "lock",
			color = "#db4b4b"
		},
		org = {
			icon = "ﴬ",
			color = "#9d7cd8",
			name = "org"
		},
	};
}
