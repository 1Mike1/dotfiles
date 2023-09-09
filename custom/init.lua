vim.opt.relativenumber=true
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.mouse = "a" -- enable mouse
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.smartcase = true -- ignores case for search unless a capital is used in search
vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.scrolloff = 10
-- vim.opt.cmdheight = 2
vim.opt.showmode = false
vim.opt.numberwidth = 5 -- wider gutter
vim.opt.linebreak = true -- don't break words on wrap
vim.opt.smartindent = true
vim.opt.completeopt = "menuone,noselect" -- nvim-cmp
-- vim.opt.completeopt = {"menuone", "longest", "preview"}
vim.opt.signcolumn = "yes" -- always show the signcolumn
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- Give me some fenced codeblock goodness
vim.g.markdown_fenced_languages = {
  "html",
  "javascript",
  "javascriptreact",
  "typescript",
  "json",
  "css",
  "scss",
  "lua",
  "vim",
  "bash",
  "python",
  "python3",
  "ts=typescript",
}

--tmux
-- vim.cmd([[
--   noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
--   noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
--   noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
--   noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
--   noremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>
-- ]])
--
-- -- clipboard
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
