return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')

    -- Configure GDB for C/C++ debugging
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/usr/bin/gdb', -- Ensure this path is correct for your system
      args = {}
    }

    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'cppdbg',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
      },
    }

    dap.configurations.c = dap.configurations.cpp -- Use the same configuration for C
    -- Add any additional nvim-dap setup here
  end,
  -- Specify any event or condition to trigger the lazy loading of nvim-dap
  -- This is optional and can be adjusted based on your preferences or requirements
  event = "BufRead",
}
