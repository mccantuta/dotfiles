vim.o.termguicolors = true

require('keymaps')
require('plugins.lazy')
require('plugins.go')
require('plugins.lualine')
require('options')
require('misc')
require('plugins.comment')
require('plugins.blankline')
require('plugins.dap')
require('plugins.gitsigns')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.trouble')

-- Set colorscheme
require("themes.github")

--vim: ts=4 sts=2 sw=2 et
