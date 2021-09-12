require'nvim-web-devicons'.setup {
	-- globally enable default icons (default to false)
	default = true;
	override = {
		default_icon = {
			icon = "",
			color = "#6d8086",
			name = "Default",
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
		png = {
			icon = "",
			color = "#a074c4",
			name = "png"
		},
		jpg = {
			icon = "",
			color = "#a074c4",
			name = "jpg"
		},
		pdf = {
			icon = "",
			color = "#b30b00",
			name = "pdf"
		},
		dockerfile = {
			icon = "",
			name = "Dockerfile",
			color = "#3d59a1",
		},
		lock = {
			icon = "",
			name = "lock",
			color = "#db4b4b"
		},
	};
}
