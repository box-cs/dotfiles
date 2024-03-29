local lib = require "lib"

require('packer').startup(function(use)
  -- Cope-ilot
  use 'github/copilot.vim'
  -- Packer
  use 'wbthomason/packer.nvim'
  -- Colorscheme
  use 'joshdick/onedark.vim'
  use 'sainnhe/gruvbox-material'
  use 'dylanaraps/wal.vim'
  -- Lsp Signature (hints)
  use 'ray-x/lsp_signature.nvim'
  -- General
  use { 'neoclide/coc.nvim', branch = 'release' }
  use {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  }
  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  -- IDE-like packages
  use 'nvim-tree/nvim-tree.lua'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('telescope').setup()
    end
  }
  use { 'lukas-reineke/indent-blankline.nvim', config = function()
    require("ibl").setup()
  end }
  use { 'dgagn/diagflow.nvim', config = function()
    require('diagflow').setup()
  end }
  use { 'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function() require('ufo').setup() end }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  -- maps
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- theme
  use 'NvChad/nvim-colorizer.lua'
  use 'projekt0n/github-nvim-theme'
end)
-- setups
require('github-theme').setup({
  options = {
    dim_inactive = true,
    styles = {
      comments = 'NONE', -- `:help attr-list`
      keywords = 'NONE',
      variables = 'bold',
      types = 'italic',
    },
  },
})
require('colorizer').setup()
require('nvim-tree').setup {
  hijack_cursor = true,
  view = { width = 30 }
}
require('diagflow').setup()
lib.nvim_ufo_setup()
lib.lsp_zero_setup()
