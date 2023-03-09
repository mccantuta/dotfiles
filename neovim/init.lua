require("mccantuta.plugins")

require("mccantuta.basic")

require("mccantuta.keymaps")

require("mccantuta.lualine")

require("mccantuta.comment")

require("mccantuta.indent_blankline")

require("mccantuta.gitsigns")

require("mccantuta.telescope")

require("mccantuta.treesitter")

require("mccantuta.diagnostic")

require("mccantuta.lsp")

require("mccantuta.neodev")

require("mccantuta.mason")

require("mccantuta.fidget")

require("mccantuta.cmp")

-- Set colorscheme
vim.o.termguicolors = true
require("mccantuta.theme.onedark")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw2 et
