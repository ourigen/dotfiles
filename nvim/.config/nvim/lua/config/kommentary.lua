require('kommentary.config').configure_language(
	"default", {
		prefer_single_line_comments = true,
		use_consistent_indentation = true,
		ignore_whitespace = true
	},
	"rust", {
		single_line_comment_string = "//",
		multi_line_comment_strings = {"/*", "*/"},
	}
)
