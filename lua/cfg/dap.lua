local dap = require 'dap'

dap.adapters.coreclr = {
  type = 'executable',
  command = '/home/iz/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return "/home/iz/Projects/Alif/Alif-Audit/Audit/src/Audit.API/bin/Debug/net6.0/Audit.API.dll"
    end,
  },
}
