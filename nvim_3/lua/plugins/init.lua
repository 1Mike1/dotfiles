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
--    {
--        'mrcjkb/rustaceanvim',
--        version = '^5', -- Recommended
--        lazy = false, -- This plugin is already lazy
--        ft = "rust",
--        config = function ()
--            local mason_registry = require('mason-registry')
--            local codelldb = mason_registry.get_package("codelldb")
--            local extension_path = codelldb:get_install_path() .. "/extension/"
--            local codelldb_path = extension_path .. "adapter/codelldb"
--            local liblldb_path = extension_path.. "lldb/lib/liblldb.dylib"
--            -- If you are on Linux, replace the line above with the line below:
--            -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
--            local cfg = require('rustaceanvim.config')
--
--            vim.g.rustaceanvim = {
--                dap = {
--                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
--                },
--            }
--        end
--    },
--
--    {
--        'rust-lang/rust.vim',
--        ft = "rust",
--        init = function ()
--            vim.g.rustfmt_autosave = 1
--        end
--    },

--    {
--        'mfussenegger/nvim-dap',
--        config = function()
--            local dap, dapui = require("dap"), require("dapui")
--            dap.listeners.before.attach.dapui_config = function()
--                dapui.open()
--            end
--            dap.listeners.before.launch.dapui_config = function()
--                dapui.open()
--            end
--            dap.listeners.before.event_terminated.dapui_config = function()
--                dapui.close()
--            end
--            dap.listeners.before.event_exited.dapui_config = function()
--                dapui.close()
--            end
--        end,
--    },
--
--    {
--        'rcarriga/nvim-dap-ui', 
--        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
--        config = function()
--            require("dapui").setup()
--        end,
--    },

--    {
--        'saecki/crates.nvim',
--        ft = {"toml"},
--        config = function()
--            require("crates").setup {
--                completion = {
--                    cmp = {
--                        enabled = true
--                    },
--                },
--            }
--            require('cmp').setup.buffer({
--                sources = { { name = "crates" }}
--            })
--        end
--    }
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
