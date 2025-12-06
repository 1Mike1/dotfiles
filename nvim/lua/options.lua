require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--vim.g.mapleader = " "
--
--vim.scriptencoding = "utf-8"
--vim.opt.encoding = "utf-8"
--vim.opt.fileencoding = "utf-8"
--
--vim.opt.number = true
--
--vim.opt.autoindent = true
--vim.opt.smartindent = true
--vim.opt.hlsearch = true
--vim.opt.backup = false
--vim.opt.showcmd = true
--vim.opt.cmdheight = 0
--vim.opt.laststatus = 0
--vim.opt.expandtab = true
--vim.opt.scrolloff = 10
--vim.opt.inccommand = "split"
--vim.opt.ignorecase = true
--vim.opt.smarttab = true
--vim.opt.breakindent = true
--vim.opt.shiftwidth = 2
--vim.opt.tabstop = 2
--vim.opt.wrap = false
--vim.opt.backspace = { "start", "eol", "indent" }
--vim.opt.path:append({ "**" })
--vim.opt.wildignore:append({ "*/node_modules/*" })
--vim.opt.splitbelow = true
--vim.opt.splitright = true
--vim.opt.splitkeep = "cursor"
--vim.opt.mouse = ""
--
---- Add asterisks in block comments
--vim.opt.formatoptions:append({ "r" })
--
--
-- Get current sessionoptions as a string
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
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
vim.g.dap_virtual_text = true
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

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>")
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>")

