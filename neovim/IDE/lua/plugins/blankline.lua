-- Enable `lukas-reineke/indent-blankline.nvim`
require('ibl').setup {
  indent = { char = "│", tab_char = "│" },
  scope = {
        show_start = true,
        show_end = true,
  }
}
