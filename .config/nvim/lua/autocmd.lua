local lib = require 'lib'

vim.api.nvim_create_autocmd("WinClosed", {
  desc = "Closes nvim-tree on various conditions after a window has been closed",
  callback = function()
    local winnr = tonumber(vim.fn.expand("<amatch>"))
    vim.schedule_wrap(lib.tab_win_closed(winnr))
  end,
  nested = true
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  desc = "Resize nvim-tree if nvim window got resized",
  group = vim.api.nvim_create_augroup("NvimTreeResize", { clear = true }),
  callback = function()
    local ratio = 20 / 100
    local width = math.floor(vim.go.columns * ratio)
    vim.cmd("tabdo NvimTreeResize " .. width)
  end,
})
