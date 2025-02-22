-- Install lazylazy
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

require('lazy').setup({ -- IF NOT WORKS - RUN :Lazy build markdown-preview.nvim
  'onsails/lspkind.nvim',
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install && git restore .",
    -- or if you use yarn: (I have not checked this, I use npm)
    -- build = "cd app && yarn install && git restore .",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

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

  { "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"}
  },
  'theHamsta/nvim-dap-virtual-text',
  'leoluz/nvim-dap-go',

  {
    'ray-x/go.nvim',
    dependencies = {
      'mfussenegger/nvim-dap', -- Debug Adapter Protocol
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'ray-x/guihua.lua',
    }
  },
  {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    }
  },

  {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
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
  'lewis6991/gitsigns.nvim',

  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- Add indentation guides even on blank lines
  'numToStr/Comment.nvim',
  --'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  'nvim-telescope/telescope-symbols.nvim',

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

  { "nvim-neotest/nvim-nio" },

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
})
