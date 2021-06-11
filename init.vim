call plug#begin('~/.config/nvim/plugged')
Plug 'kevinhwang91/rnvimr'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'folke/tokyonight.nvim'
call plug#end()


let mapleader = ","
set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

"----------- NVIM TREE CONFIG -----------
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
set termguicolors " this variable must be enabled for colors to be applied properly


tnoremap <silent> <leader>r <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <leader>f :RnvimrToggle<CR>
tnoremap <silent> <leader>j <C-\><C-n>:RnvimrToggle<CR>

colorscheme tokyonight
