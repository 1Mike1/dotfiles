-- PYRIGHT (Python)
vim.lsp.config.pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" },
}

-- RUST-ANALYZER
vim.lsp.config.rust_analyzer = {
    cmd = { "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = true,
        },
    },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml" },
}

-- Auto-start servers when opening files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function(e)
        vim.lsp.start(vim.lsp.config.pyright, { bufnr = e.buf })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    callback = function(e)
        vim.lsp.start(vim.lsp.config.rust_analyzer, { bufnr = e.buf })
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

