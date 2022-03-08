" --------------------------------------------- PLUGINS ---------------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
" PRE-REQUISITES
" pip3 install ranger-fm pynvim
" First of all, install vim-plug https://github.com/junegunn/vim-plug

call plug#begin('~/.config/nvim/plugged')
Plug 'kevinhwang91/rnvimr'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Do not forget to install all languages syntax using TSInstall go, java, html, etc
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " General fuzzy finder
" Telescope
" https://github.com/nvim-telescope/telescope.nvim
" PRE-REQUISITES: Install rg. brew install rg
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" AutoComplete
Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'jiangmiao/auto-pairs'
" Java
Plug 'mfussenegger/nvim-jdtls'
" THEMES
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/edge'
Plug 'arcticicestudio/nord-vim'
Plug 'haishanh/night-owl.vim'
Plug 'rebelot/kanagawa.nvim'
" Miscellaneous
Plug 'webdevel/tabulous'
Plug 'mhinz/vim-startify'
Plug 'dominikduda/vim_current_word'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'akinsho/toggleterm.nvim'

call plug#end()

" --------------------------------------------- GENERAL ---------------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
let mapleader = ","
set number
set mouse=a
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set termguicolors " this variable must be enabled for colors to be applied properly
set ignorecase smartcase " search case-insensitively unless uppercase characters are used
set inccommand=nosplit
"set relativenumber
set nowrap
set splitbelow
set splitright
set clipboard=unnamedplus
set background=dark
set t_ut=
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

"------------------------------------------ TABULOUS CONFIG -----------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
map <silent> <leader>ren :call g:tabulous#renameTab()<cr>

"------------------------------------------ GRNVIMR CONFIG -----------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
"  https://github.com/kevinhwang91/rnvimr
" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1
tnoremap <silent> <leader>r <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <leader>f :RnvimrToggle<CR>
tnoremap <silent> <leader>j <C-\><C-n>:RnvimrToggle<CR>

"----------------------------------------- NVIM TREE CONFIG ----------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
" Install NERD fonts -> https://github.com/ryanoasis/nerd-fonts
lua <<EOF
require('nvim-tree').setup {
    open_on_setup = false,
    open_on_tab = false
    }
EOF

let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
nnoremap <silent> <leader>t :NvimTreeToggle<CR>

"------------------------------------------ VIM GO CONFIG -----------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
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
au FileType go inoremap <C-Space> <C-x><C-o>

"---------------------------------------- TELESCOPE CONFIG ---------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua <<EOF
require('telescope').setup { 
    defaults = { file_ignore_patterns = {"vendor"} } 
    }
EOF

"--------------------------------------- VIM AIRLINE CONFIG --------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
"let g:airline_theme='deus'
let g:airline_theme='powerlineish'

"------------------------------------- NVIM TREESITTER CONFIG ------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
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

"--------------------------------------- NEOVIM LSP CONFIG --------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
" Install Language Servers
" npm i -g vscode-langservers-extracted
" npm install -g dockerfile-language-server-nodejs
" npm install -g typescript typescript-language-server

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.html lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.java lua vim.lsp.buf.formatting_sync(nil, 100)

lua << EOF
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.bashls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.tsserver.setup{}

EOF

"----------------------------------------- NVIM-COMPE ---------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true

au FileType html,js inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

"--------------------------------------------- JAVA LSP JDTLS ---------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'nvim-java-lsp.sh'}})
  augroup end
endif
nnoremap <leader>ca <Cmd>lua require('jdtls').code_action()<CR>

"-------------------------------------------------- INDENT ------------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
lua <<EOF
vim.opt.list = true
require("indent_blankline").setup {
    --show_current_context = true,
    --show_current_context_start = true,
}
EOF

"--------------------------------------------- TOGGLE TERM ------------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
lua <<EOF
require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = 'float',
}
EOF


"-------------------------------------------------- THEMES ------------------------------------------------------
" ---------------------------------------------------------------------------------------------------------------
let g:tokyonight_style = "night" "Options: storm, night, day
let g:tokyonight_italic_functions = 1
let g:tokyonight_dark_float=1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
"let g:tokyonight_transparent = "true"
"let g:tokyonight_transparent_sidebar = "true"
"Load the colorscheme
colorscheme tokyonight

let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1
"colorscheme edge

let g:nord_uniform_diff_background = 1
"colorscheme nord

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'nightowl' }
"colorscheme night-owl

"colorscheme kanagawa
