return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			kotlin = { "ktlint" },
			dart = { "dart_format" },
			cpp = { "clang-format" },
			c = { "clang-format" },
		},
		formatters = {
			dart_format = {
				command = "dart",
				args = { "format", "$FILENAME" },
			},
		},
		format_on_save = {
			lsp_format = "fallback",
		},
	},
}
