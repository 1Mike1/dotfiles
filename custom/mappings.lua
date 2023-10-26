local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.lazygit = {
  n = {
    ["<leader>gg"] = {"<cmd> LazyGit <CR>", "LazyGit", opts={silent=true, nowait=true}},
    ["<leader>gc"] = {"<cmd> LazyGitConfig <CR>", "LazyGitConfig", opts={silent=true, nowait=true}},
    ["<leader>gf"] = {"<cmd> LazyGitFilter <CR>", "LazyGitConfig", opts={silent=true, nowait=true}},
    ["<leader>gcf"] = {"<cmd> LazyGitFilterCurrentFile <CR>", "LazyGitFilterCurrentFile", opts={silent=true, nowait=true}},
  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](),'')
      end,
      "Copilot Accept", {replace_keycodes=true, nowait=true, silent=true, expr=true, noremap=true},
    },
  },
}

M.mason = {
  n = {
    ["<leader>cm"] = {"<cmd> Mason <CR>", "Mason", opts={silent=true, nowait=true}},
  },
}

M.session = {
  n = {
    ["<leader>ss"] = {"<cmd> SessionSave <CR>", "SessionSave", opts={silent=true, nowait=true}},
    ["<leader>sd"] = {"<cmd> SessionDelete <CR>", "SessionDelete", opts={silent=true, nowait=true}},
    ["<leader>sr"] = {"<cmd> SessionRestore <CR>", "SessionRestore", opts={silent=true, nowait=true}},

  },
}

local toggle_modes = {'n', 't'}
local mappings = {
  { toggle_modes, '<A-h>', function () require("nvterm.terminal").toggle('horizontal') end },
  { toggle_modes, '<A-v>', function () require("nvterm.terminal").toggle('vertical') end },
  { toggle_modes, '<A-i>', function () require("nvterm.terminal").toggle('float') end },
  { toggle_modes, '<A-p>', function () require("nvterm.terminal").send('python3','float') end },
  { toggle_modes, '<A-n>', function () require("nvterm.terminal").send('node','float') end },
}
local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end

return M
