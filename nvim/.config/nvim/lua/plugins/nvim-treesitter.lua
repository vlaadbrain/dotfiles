return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua", "javascript", "typescript", "dart", "kotlin" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true , additional_vim_regex_highlighting = false },
        indent = { enable = true },
    },
  },
}
