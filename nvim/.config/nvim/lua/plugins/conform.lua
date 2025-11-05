return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = false,
		formatters_by_ft = {
			lua = { "stylua" },
			kotlin = { "ktlint" },
			dart = { "dart_format" },
			cpp = { "clang_format" },
			c = { "clang_format" },
		},
		formatters = {
			dart_format = {
				command = "dart",
				args = { "format", "$FILENAME" },
			},
			clang_format = {
				prepend_args = { "--style=file" },
				args = function()
					local shiftwidth = vim.api.nvim_get_option("shiftwidth")
					local expandtab = vim.api.nvim_get_option("expandtab")
					return {
						"--style={BasedOnStyle: llvm, IndentWidth: "
							.. shiftwidth
							.. ", UseTab: "
							.. (expandtab and "Never" or "Always")
							.. "}",
					}
				end,
			},
		},
	},
}
