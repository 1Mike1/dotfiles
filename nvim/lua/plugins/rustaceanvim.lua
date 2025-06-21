return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  ft = "rust",
  config = function()
    local ok, mason_registry = pcall(require, 'mason-registry')
    if not ok then
      vim.notify("Failed to load mason-registry", vim.log.levels.ERROR)
      return
    end

    -- Use pcall to safely get the package
    local success, codelldb = pcall(mason_registry.get_package, "codelldb")
    if not success then
      vim.notify("codelldb is not available in mason-registry", vim.log.levels.ERROR)
      return
    end

    if not codelldb:is_installed() then
      vim.notify("codelldb is not installed. Please run :MasonInstall codelldb", vim.log.levels.ERROR)
      return
    end

    local extension_path = codelldb:get_install_path() .. "/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.so" -- or .dylib on macOS

    local cfg = require('rustaceanvim.config')

    vim.g.rustaceanvim = {
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end,
}
