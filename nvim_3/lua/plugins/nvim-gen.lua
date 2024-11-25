return {
    "David-Kunz/gen.nvim",
    lazy=false,
    config = function()
        local opts = {
            model = "gemma:2b"
        }
        require("gen").setup(opts)
    end,

}
