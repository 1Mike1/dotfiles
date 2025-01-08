return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "pyright",
            "tailwindcss-language-server",
            "angular-language-server",
            "lua-language-server",
            "typescript-language-server",
            "rust-analyzer", -- install using mason bcz there is no need of lsp config
            "codelldb", -- insall using mason, no need of lsp config
        },
    },
}

