vim.o.termguicolors = true

require('keymaps')
require('plugins.lazy')
require('plugins.nvimtree')
require('options')
require('misc')
-- Set colorscheme
--require("themes.vague")
require("themes.nordic") -- nordic, everforest,gruvbox-material
    --require("themes.gruvbox-material") -- NIGHT
--require("themes.kanagawa-paper") -- NIGHT
--require("themes.catppuccin") --DAY

--vim: ts=4 sts=2 sw=2 et
