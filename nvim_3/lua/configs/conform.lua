local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    rust = { "rustfmt" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
