local M = {}

M.dap = {
  {"<leader>db", "<cmd> DapToggleBreakpoint <CR>", desc = "Toggle breakpoint"},
  {"<leader>dus", function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      desc = "Open debugging sidebar"
  }
}

M.crates = {
  {"<leader>rcu",
      function ()
        require('crates').upgrade_all_crates()
      end,
      desc = "update crates"
  }
}

return M
