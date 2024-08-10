return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "black",
            "isort",
            "debugpy",
            "mypy",
            "ruff",
            "pyright",
            "rust-analyzer",
            "prettierd",
        },
    },
}

