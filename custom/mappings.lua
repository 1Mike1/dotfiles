local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
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

return M
