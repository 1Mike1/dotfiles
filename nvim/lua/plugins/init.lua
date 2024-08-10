return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        opts = { direction = "float", float_opts = { border = "rounded" } },
        keys = { { "<A-t>", "<CMD>ToggleTerm<CR>", desc = "Toggle Terminal", mode = { "n", "t" } } },
    },
    --{
    --    "rcarriga/nvim-dap-ui",
    --    dependencies = {
    --        "mfussenegger/nvim-dap",
    --        "nvim-neotest/nvim-nio"
    --    }
    --},
    --{
    --    "rcarriga/nvim-dap-ui",
    --    lazy=false,
    --    dependencies = "mfussenegger/nvim-dap",
    --    config = function()
    --        local dap = require("dap")
    --        local dapui = require("dapui")
    --        dapui.setup()
    --        dap.listeners.after.event_initialized["dapui_config"] = function()
    --            dapui.open()
    --        end
    --        dap.listeners.before.event_terminated["dapui_config"] = function()
    --            dapui.close()
    --        end
    --        dap.listeners.before.event_exited["dapui_config"] = function()
    --            dapui.close()
    --        end
    --    end
    --},

    -- These are some examples, uncomment them if you want to see them work!
    --{
    --	"williamboman/mason.nvim",
    --	opts = {
    --		ensure_installed = {
    --			"lua-language-server", "stylua",
    --			"html-lsp", "css-lsp" , "prettier"
    --		},
    --	},
    --},
}
