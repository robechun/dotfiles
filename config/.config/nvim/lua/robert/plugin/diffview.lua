local dv = require('diffview')
-- We want to keep the scrollbind and cursorbind to be default settings so we disable it here and only enable it for diffview.
vim.o.scrollbind = false
vim.o.cursorbind = false

local last_tabpage = vim.api.nvim_get_current_tabpage()

function diff_history_toggle()
  local lib = require'diffview.lib'
  local view = lib.get_current_view()
  if view then
    vim.o.scrollbind = false
    vim.o.cursorbind = false

    -- Current tabpage is a Diffview: go to previous tabpage
    vim.api.nvim_set_current_tabpage(last_tabpage)
  else
    vim.o.scrollbind = true
    vim.o.cursorbind = true

    -- We are not in a Diffview: save current tabpagenr and go to a Diffview.
    last_tabpage = vim.api.nvim_get_current_tabpage()

    if #lib.views > 0 then
      -- An open Diffview exists: go to that one.
      vim.api.nvim_set_current_tabpage(lib.views[1].tabpage)
    else
      -- No open Diffview exists: Open a new one
      vim.cmd(":DiffviewFileHistory")
    end
  end
end

return {
    diff_history_toggle = diff_history_toggle
}
