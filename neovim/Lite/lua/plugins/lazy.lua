-- Install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  -- Git related plugins
  'tpope/vim-fugitive',

  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

   { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- Add indentation guides even on blank lines

  'numToStr/Comment.nvim',

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-telescope/telescope-symbols.nvim',

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

  -- THEMES   
  'navarasu/onedark.nvim', -- Theme inspired by Atom
  'folke/tokyonight.nvim',
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  "rebelot/kanagawa.nvim",
  'shaunsingh/nord.nvim',
  'morhetz/gruvbox',
  'sainnhe/gruvbox-material',
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  'oxfist/night-owl.nvim',
  'xero/miasma.nvim',
  'AlexvZyl/nordic.nvim',
  'sainnhe/everforest',
  'Softmotions/vim-dark-frost-theme',
  'lewpoly/sherbet.nvim',
  'tiagovla/tokyodark.nvim',
  { "rose-pine/neovim", name = "rose-pine" },
  { 'projekt0n/github-nvim-theme' },
  'fenetikm/falcon',
  'mhartington/oceanic-next',
  'marko-cerovac/material.nvim',
  {'nyoom-engineering/oxocarbon.nvim'},
  'slugbyte/lackluster.nvim',
  'vague2k/vague.nvim',
  'thesimonho/kanagawa-paper.nvim',
  'oahlen/iceberg.nvim',
  'metalelf0/base16-black-metal-scheme',
})
