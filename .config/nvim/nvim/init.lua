vim.cmd([[
  set secure
  set noerrorbells
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set autoindent
  set nowrap
  set number
  set scrolloff=12
  set colorcolumn=90
  set signcolumn=yes
  set termguicolors
  ]])

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'joshdick/onedark.vim'
  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
end)

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

pcall(vim.cmd, 'colorscheme onedark')

