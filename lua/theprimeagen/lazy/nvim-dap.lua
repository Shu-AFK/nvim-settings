return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')

    -- Configure GDB for C/C++ debugging
    dap.adapters.gdb = {
      type = 'executable',
      command = '/usr/bin/gdb', -- Ensure this path is correct for your system
      args = {'--quite', '--interpreter=mi2'}
    }

    dap.configurations.c = {
      {
        name = 'Launch file',
        type = 'gdb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        setupCommands = {
            {
                 text = '-enable-pretty-printing',
                 description = 'enable pretty printing',
                 ignoreFailures = false
            },
         },
      },
    }

    dap.configurations.cpp = dap.configurations.c -- Use the same configuration for Cpp
    -- Add any additional nvim-dap setup here
  end,
  -- Specify any event or condition to trigger the lazy loading of nvim-dap
  -- This is optional and can be adjusted based on your preferences or requirements
  event = "BufRead",
}
