return {
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
}
