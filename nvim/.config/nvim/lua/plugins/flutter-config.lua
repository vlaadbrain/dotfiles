return {
  -- 'akinsho/flutter-tools.nvim',
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('flutter-tools').setup {
      root_patterns = { 'pubspec.yaml' },
      widget_guides = {
        enabled = false,
      },
      decorations = {
        statusline = {
          app_version = false,
          device = false,
        },
      },
      dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
      },
      dev_log = {
        open_cmd = '10split',
        -- open_cmd = 'splitbelow ++bo',
        focus_on_open = false,
      },
    }
  end,
}
