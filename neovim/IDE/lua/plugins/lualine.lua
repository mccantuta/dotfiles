require('lualine').setup {
  options = {
    icons_enabled = true,
    --theme = 'powerline_dark',
    --component_separators = '|',
    --section_separators = '',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {'mode'},--'buffers',
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'filetype'} --'fileformat', 
  }
}

