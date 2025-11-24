return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	opts = {
		---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
		provider = "ollama", -- The provider used in Aider mode or in the planning phase of Cursor Planning Mode
		---@alias Mode "agentic" | "legacy"
		mode = "agentic", -- The default mode for interaction. "agentic" uses tools to automatically generate code, "legacy" uses the old planning method to generate code.
		-- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
		-- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
		-- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
		auto_suggestions_provider = "claude",
		providers = {
			claude = {
				endpoint = "https://api.anthropic.com",
				-- model = "claude-3-5-sonnet-20241022",
				model = "claude-sonnet-4-5-20250929",
				extra_request_body = {
					temperature = 0.75,
					max_tokens = 4096,
				},
			},
      ollama = {
        api_key_name = "",
        endpoint = "http://127.0.0.1:11434/v1",
        model = "qwen2.5-coder:32b",
        max_tokens = 4096,
        disable_tools = true,
      },
		},
		behavior = {
			auto_apply_diff_after_generation = false,
			auto_approve_tool_permissions = false,
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		"folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
