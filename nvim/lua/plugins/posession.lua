-- Sessions
return {
    "jedrzejboczar/possession.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = { autosave = { current = true } },
    cmd = { "PossessionSave", "PossessionRestore", "PossessionDelete" },
    --keys = {
    --    { "<leader>fs", "<CMD>Telescope possession list<CR>", desc = "Find Sessions" },
    --    { "<leader>ss", "<CMD>PossessionSave<CR>", desc = "SessionSave" },
    --    { "<leader>sr", "<CMD>PossessionRestore<CR>", desc = "SessionRestore" },
    --    { "<leader>sd", "<CMD>PossessionDelete<CR>", desc = "SessionDelete" },
    --},
    setup = function()
        local opts={
            session_dir = vim.fn.stdpath("data").."/sessions/",
            autosave={current=true},
            silent=true,
            nowait=true,
        }
    end
}

