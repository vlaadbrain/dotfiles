require("grayhat.java")
require("grayhat.colors")
require("grayhat.loading")
require("grayhat.remap")
require("grayhat.set")
require("grayhat.status")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	end,
})

local remember_cursor_group = vim.api.nvim_create_augroup("vimrc-remember-cursor-position", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Restore cursor position after opening file", -- Optional description
  group = remember_cursor_group,
  pattern = "*", -- Apply to all files
  callback = function()
    -- Lua equivalent of the Vimscript logic
    if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})

-- This enables native document color support for all compatible LSPs (including Dart)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.colorProvider then
      vim.lsp.document_color.enable(true, { bufnr = args.buf })
    end
  end,
})
