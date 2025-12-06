-- ~/.config/nvim/lua/plugins/rustaceanvim.lua
return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" }, -- load only for Rust files
  config = function()
    local ok, rust = pcall(require, "rustaceanvim")
    if not ok or not rust.config then
      vim.notify("rustaceanvim plugin not available or config function missing!", vim.log.levels.WARN)
      return
    end

    rust.config({
      tools_path = vim.fn.stdpath("data") .. "/rust-tools",
      tools = {
        inlay_hints = { auto = true },
        runnables = { use_telescope = true },
      },
      lsp = {
        -- optional: add LSP overrides here
      },
    })
  end,
}
