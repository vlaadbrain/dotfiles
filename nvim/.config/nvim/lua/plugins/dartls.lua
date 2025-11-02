return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("dartls", {
			cmd = { "dart", "language-server", "--protocol=lsp" },
			filetypes = { "dart" },
			init_options = {
				closingLabels = true,
				flutterOutline = true,
				onlyAnalyzeProjectsWithOpenFiles = true,
				outline = true,
				suggestFromUnimportedLibraries = true,
			},
			settings = {
				dart = {
					completeFunctionCalls = true,
					showTodos = true,
					hint = { enable = true },
				},
			},
		})
		vim.lsp.enable("dartls")
	end,
}
