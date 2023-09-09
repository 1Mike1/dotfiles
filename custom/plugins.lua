local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {"TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight", "TmuxNavigatePrevious"},
    lazy = false,
  },
  {
    "NvChad/nvterm",
    config = function ()
      require("nvterm").setup()
    end,
  },
  {
    'rmagatti/auto-session',
    cmd = {"SessionSave", "SessionRestore", "Autosession", "SessionLoad" },
    opts = function()
      return require("custom.configs.auto-session")
    end,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_enable_last_session = true,
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  },
  {
    "github/copilot.vim",
 	  lazy = false,
 	  config = function()
      -- Mapping tab is already used by NvChad       
      -- vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      -- vim.g.copilot_tab_fallback = "";  
      -- The mapping is set to other key, see custom/lua/mappings  
      -- or run <leader>ch to see copilot mapping section  
 	  end
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    cmd = {"LazyGit", "LazyGitConfig", "LazyGitFilter", "LazyGitFilterCurrentFile"},
    dependencies =  {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
}

return plugins
