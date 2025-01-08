return {
    'rmagatti/auto-session',
    ---enables autocomplete for opts
    ---@module "auto-session"
    --@type AutoSession.Config
    lazy = false,
    opts = {},
    cmd = {"SessionSave", "SessionRestore", "Autosession", "SessionLoad", "SessionSearch" },
    config = function()
        require('auto-session').setup {
            auto_restore_last_session = false,
            enabled = true,
            log_level = "info",
            root_dir = "/home/mithlesh.kumar2/.local/share/nvim/sessions/",
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        }
        --log_level = 'info',
        --auto_session_enable_last_session = false,
        --auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
        --auto_session_enabled = true,
        --auto_save_enabled = nil,
        --auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        --auto_restore_enabled = nil,
        --auto_session_use_git_branch = nil,
        ---- the configs below are lua only
        --bypass_session_save_file_types = nil,
        --}
        --require("auto-session").setup {
        --    log_level = "error",
        --    auto_session_enable_last_session = true,
        --}
    end
}

