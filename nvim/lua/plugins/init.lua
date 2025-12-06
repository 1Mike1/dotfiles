return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require "configs.lspconfig"
        end,
    },
  --{
  --  "williamboman/mason.nvim",
  --  opts = {
  --    ensure_installed = {
  --      "pyright",
  --      "tailwindcss-language-server",
  --      "angular-language-server",
  --      "lua-language-server",
  --      "typescript-language-server",
  --      "rust-analyzer", -- install using mason bcz there is no need of lsp config
  --      "codelldb", -- insall using mason, no need of lsp config
  --    },
  --  },
  --}

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
