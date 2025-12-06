return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
        --local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        local path = "/usr/bin/python3"
        require("dap-python").setup(path)
        table.insert(require('dap').configurations.python, {
            type = 'python',
            request = 'launch',
            name = 'My custom launch configuration',
            program = '${file}',
        })
        -- require("core.utils").load_mappings("dap_python")
    end
}
