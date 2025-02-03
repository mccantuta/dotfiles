-- Go
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})
require('go').setup({
  goimports ='gopls', -- goimports command, can be gopls[default] or either goimports or golines if need to split long lines
  gofmt = 'gopls', -- gofmt through gopls: alternative is gofumpt, goimports, golines, gofmt, etc
  lsp_semantic_highlights = true, -- use highlights from gopls
  null_ls = {           -- set to false to disable null-ls setup
    golangci_lint = {
      method = {"NULL_LS_DIAGNOSTICS_ON_SAVE", "NULL_LS_DIAGNOSTICS_ON_OPEN"}, -- when it should run
      -- disable = {'errcheck', 'staticcheck'}, -- linters to disable empty by default
      enable = {'govet', 'ineffassign','revive', 'gosimple'}, -- linters to enable; empty by default
      severity = vim.diagnostic.severity.INFO, -- severity level of the diagnostics
    },
  },
  lsp_document_formatting = true, -- set to true: use gopls to format -- false if you want to use other formatter tool(e.g. efm, nulls)
  lsp_inlay_hints = {
    enable = true, -- this is the only field apply to neovim > 0.10
  },
  trouble = false, -- true: use trouble to open quickfix
  dap_debug = true, -- set to true to enable dap
  dap_debug_keymap = true, -- set keymaps for debugger
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true, -- set to true to enable dap virtual text
})

