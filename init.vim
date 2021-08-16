" PRE-REQUISITES
" pip3 install ranger-fm pynvim
" First of all, install vim-plug https://github.com/junegunn/vim-plug

call plug#begin('~/.config/nvim/plugged')
Plug 'kevinhwang91/rnvimr'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Do not forget to install all languages syntax using TSInstall go 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " General fuzzy finder
" Telescope
" https://github.com/nvim-telescope/telescope.nvim
" PRE-REQUISITES: Install rg. brew install rg
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" NEWS
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
call plug#end()

let mapleader = ","
set number
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set termguicolors " this variable must be enabled for colors to be applied properly
set ignorecase smartcase " search case-insensitively unless uppercase characters are used
set inccommand=nosplit
"set nowrap
" make escape work in terminal
tnoremap <Esc> <C-\><C-n>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" ---------- RNVIMR CONFIG ---------------
"  https://github.com/kevinhwang91/rnvimr
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
tnoremap <silent> <leader>r <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <leader>f :RnvimrToggle<CR>
tnoremap <silent> <leader>j <C-\><C-n>:RnvimrToggle<CR>


"----------- NVIM TREE CONFIG -----------
" Install NERD fonts -> https://github.com/ryanoasis/nerd-fonts
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
nnoremap <silent> <leader>t :NvimTreeToggle<CR>

" ---------- VIM GO CONFIG --------------
"  https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_addtags_transform = "camelcase"

au FileType go nmap <F12> <Plug>(go-def)
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif
" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction
"au FileType go nmap <Leader>gd <Plug>(go-def-tab)
"au FileType go nmap <Leader>gs <Plug>(go-def-split)
au FileType go nmap <Leader>d <Plug>(go-def-vertical)
au FileType go nmap <Leader>i <Plug>(go-implements)
inoremap <C-Space> <C-x><C-o>

"--------- TELESCOPE CONFIG ---------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" ----
lua <<EOF
require('telescope').setup { 
    defaults = { file_ignore_patterns = {"vendor"} } 
    }
EOF

" -------- VIM AIRLINE CONFIG -------------
let g:airline_theme='deus'

" -------- NVIM TREESITTER CONFIG ---------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"java", "go", "gomod", "html", "javascript", "bash", "c", "comment", "cpp", "css", "dockerfile", "json", "yaml"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "rust" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
  },
}
EOF

let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
"Load the colorscheme
colorscheme tokyonight

let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
"colorscheme edge

