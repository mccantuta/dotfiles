vim.o.termguicolors = true

require('keymaps')
require('plugins.lazy')
require('plugins.nvimtree')
require('plugins.lualine')
require('options')
require('misc')
require('plugins.comment')
require('plugins.dap')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lsp')
-- Set colorscheme
--require("themes.vague")
require("themes.nordic") -- nordic, everforest,gruvbox-material
--require("themes.gruvbox-material") -- NIGHT
--require("themes.kanagawa-paper") -- NIGHT
--require("themes.catppuccin") --DAY

--vim: ts=4 sts=2 sw=2 et
