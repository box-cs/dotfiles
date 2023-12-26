vim.cmd([[
  set clipboard=unnamedplus
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
  set background=dark
  set colorcolumn=120
  set termguicolors
  set signcolumn=yes
  set smartindent
  autocmd BufWritePre * lua vim.lsp.buf.format()
]])

local lib = require 'lib'
require 'plugins'
require 'autocmd'

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- keymaps
for i = 1, 8 do
  vim.keymap.set('n', '<A-' .. i .. '>', '<cmd>tabn ' .. i .. '<CR>', { noremap = true, silent = true })
end
local builtin = require 'telescope.builtin'
-- general
vim.keymap.set('n', '<C-T>', lib.nvim_tree_new_tab, {})
vim.keymap.set('n', '<C-B>', lib.focus_toggle_nvim_tree, { noremap = true, silent = true })
-- telescope
vim.keymap.set('n', '<C-P>', builtin.find_files, {})
vim.keymap.set('n', '<C-F>', builtin.live_grep, {})
vim.keymap.set('n', '<C-O>', builtin.buffers, {})
vim.keymap.set('n', '<C-F1>', builtin.help_tags, {})
-- nvim-ufo
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local themes = {
  ["gruvbox"] = function()
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_better_performance = 1
    pcall(vim.cmd, 'colorscheme gruvbox-material')
  end,
  ["onedark"] = function()
    pcall(vim.cmd, 'colorscheme onedark')
  end,
  ["wal"] = function()
    vim.o.termguicolors = false
    pcall(vim.cmd, 'colorscheme wal')
  end
}

themes["onedark"]()
