require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- Map for lazygit with leader + gg
map("n", "<leader>gg", "<cmd> LazyGit <CR>", { desc = "LazyGit" })
map("n", "<leader>gc", "<cmd> LazyGitConfig <CR>", { desc = "LazyGitConfig" })
map("n", "<leader>gf", "<cmd> LazyGitFilter <CR>", { desc = "LazyGitFilter" })
map("n", "<leader>gcf", "<cmd> LazyGitFilterCurrentFile <CR>", { desc = "LazyGitFilterCurrentFile" })

-- Map for copilot with leader + c
map("n", "<leader>cc", "<cmd> Copilot <CR>", { desc = "Copilot" })

-- Map for mason with leader + m
map("n", "<leader>cm", "<cmd> Mason <CR>", { desc = "Mason" })

-- Map for session with leader + s
map("n", "<leader>sf", "<cmd> SessionSearch <CR>", { desc = "SessionSearch" })   --{ noremap = true }, { silent = true })
map("n", "<leader>ss", "<cmd> SessionSave <CR>", { desc = "SessionSave" })       --{ noremap = true }, { silent = true })
map("n", "<leader>sd", "<cmd> SessionDelete <CR>", { desc = "SessionDelete" })   --{ noremap = true }, { silent = true })
map("n", "<leader>sr", "<cmd> SessionRestore <CR>", { desc = "SessionRestore" }) --{ noremap = true }, { silent = true })

-- Map for nvterm
-- map({ "n", "i", "v" }, "<A-h>", function () require("nvterm.terminal").toggle('horizontal') end)
-- map({ "n", "i", "v" }, "<A-v>", function () require("nvterm.terminal").toggle('vertical') end)
map({ "n", "i", "v" }, "<A-i>", function () require("nvterm.terminal").toggle('float') end)
map({ "n", "i", "v" }, "<A-p>", function () require("nvterm.terminal").send('python3','float') end)
map({ "n", "i", "v" }, "<A-n>", function () require("nvterm.terminal").send('node','float') end)

-- map for btop with leader + tt using nvterm with width=80 and height=24
map({ "n", "i", "v" }, "<A-t>", function () require("nvterm.terminal").send('btm','float') end)

-- Map for dap
--map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "DapToggleBeakpoint" })
--map("n", "<leader>dus", function ()
--  local widgets = require('dap.ui.widgets');
--  local sidebar = widgets.sidebar(widgets.scopes);
--  sidebar.open();
--end, { desc = "Open debugging sidebar" })

-- Map for dap-python
--map("n", "<leader>dpr", function()
--  require('dap-python').test_method()
--end)

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Map for crates
map("n", "<leader>rcu", function ()
  require('crates').upgrade_all_crates()
end, { desc = "update crates" })

-- Map for copilot
map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn['copilot#Accept'](),'')
end, { desc = "Copilot Accept" })

-- map lazy sync to leader + u
map("n", "<leader>u", "<cmd> Lazy sync <CR>", { desc = "LazySync" })

-- map to save session
map("n", "<leader>ss", "<cmd> SessionSave <CR>", { desc = "SessionSave" })

-- map to restore session
map("n", "<leader>sr", "<cmd> SessionRestore <CR>", { desc = "SessionRestore" })

-- map to delete session
map("n", "<leader>sd", "<cmd> SessionDelete <CR>", { desc = "SessionDelete" })

-- map to open session list
map("n", "<leader>fs", "<cmd> Sessions <CR>", { desc = "Find Sessions" })

-- map to save file
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
