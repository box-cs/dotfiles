local tab_win_closed = function(winnr)
  local api = require "nvim-tree.api"
  local tabnr = vim.api.nvim_win_get_tabpage(winnr)
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local buf_info = vim.fn.getbufinfo(bufnr)[1]
  local tab_wins = vim.tbl_filter(function(w) return w ~= winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
  local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
  if buf_info.name:match(".*NvimTree_%d*$") then
    -- Close all nvim tree on :q
    if not vim.tbl_isempty(tab_bufs) then
      api.tree.close()
    end
  else
    if #tab_bufs == 1 then
      local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
      if last_buf_info.name:match(".*NvimTree_%d*$") then
        vim.schedule(function()
          if #vim.api.nvim_list_wins() == 1 then
            vim.cmd "quit"
          else
            vim.api.nvim_win_close(tab_wins[1], true)
          end
        end)
      end
    end
  end
end

local focus_toggle_nvim_tree = function()
  local api = require "nvim-tree.api"
  local is_open = require "nvim-tree.view".is_visible()
  local is_focused = vim.bo.filetype == 'NvimTree'
  if is_open and is_focused then
    -- close tree if it's open and in focus
    api.tree.close()
  else
    api.tree.open()
  end
end

local nvim_tree_new_tab = function()
  local api = require "nvim-tree.api"
  local is_open = require "nvim-tree.view".is_visible()
  vim.cmd('tabnew')
  -- persist nvim-tree panel if it's open when making new tabs
  if is_open then
    api.tree.open()
    vim.cmd('wincmd w')
  end
end

local nvim_ufo_setup = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
  local language_servers = require("lspconfig").util.available_servers()
  for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
      capabilities = capabilities
    })
  end

  vim.o.foldcolumn = '1'
  vim.o.foldlevel = 99
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
end

local lsp_zero_setup = function()
  local lsp = require('lsp-zero')
  lsp.preset('recommended')
  lsp.setup()
end

return {
  tab_win_closed = tab_win_closed,
  focus_toggle_nvim_tree = focus_toggle_nvim_tree,
  nvim_tree_new_tab = nvim_tree_new_tab,
  nvim_ufo_setup = nvim_ufo_setup,
  lsp_zero_setup = lsp_zero_setup
}
