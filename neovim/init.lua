vim.o.termguicolors = true

require('keymaps')
require('plugins.lazy')
require('plugins.nvimtree')
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

-- Set colorscheme
--require("themes.vague")
--require("themes.kanagawa")
--require("themes.gruvbox-material") -- NIGHT
require("themes.nordic") -- NIGHT
--require("themes.catppuccin") --DAY

--vim: ts=4 sts=2 sw=2 et
