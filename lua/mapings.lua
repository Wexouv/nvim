Map = function(l, r, m)
    m = m or "n" -- Default to normal mode
    vim.keymap.set(m, l, r)
end
Cmd = function(x) return string.format("<CMD>%s<CR>", x) end

-----------------------------------------------
Map ("<leader>y", '"+y')
Map ("<leader>q",  Cmd "q")
Map ("<C-S>",      Cmd "wall")

Map ("<C-A>",      Cmd "NvimTreeToggle")

-- Lsp
Map ("<A-Enter>",  Cmd "Lspsaga code_action")
Map ("<leader>ld", Cmd "lua vim.lsp.buf.implementation()")
Map ("<leader>lD", Cmd "lua vim.lsp.buf.definition()")
Map ("<leader>lf", Cmd "Lspsaga lsp_finder")
Map ("<leader>lF", Cmd "lua vim.lsp.buf.formatting()")
Map ("<leader>lr", Cmd "Lspsaga rename")
Map ("<leader>pd", Cmd "Lspsaga preview_definition")

Map ("<C-K>",      Cmd "Lspsaga hover_doc")
Map ("<C-T>",      Cmd "Lspsaga open_floaterm")
Map ("<C-T>",      Cmd "Lspsaga close_floaterm", "t")

-- Dap
Map ('<F5>',       Cmd 'lua require "dap".continue()')
Map ('<F10>',      Cmd 'lua require "dap".step_over()')
Map ('<F11>',      Cmd 'lua require "dap".step_into()')
Map ('<F12>',      Cmd 'lua require "dap".step_out()')
Map ('<leader>b',  Cmd 'lua require "dap".toggle_breakpoint()')
Map ('<leader>B',  Cmd 'lua require "dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))')
Map ('<leader>lp', Cmd 'lua require "dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))')
Map ('<leader>dr', Cmd 'lua require "dap".repl.open()')
Map ('<leader>dl', Cmd 'lua require "dap".run_last()')
Map ('<leader>dx', Cmd 'lua require("dap").disconnect()')

Map ("<leader>rr", "<Plug>RestNvim")
Map ("<leader>rp", "<Plug>RestNvimPreview")
Map ("<leader>r.", "<Plug>RestNvimLast")

Map("<C-c>", Cmd ":%y+") -- copy whole file content

-- Movement between tabs
Map("<leader>n", Cmd "tabprevious")
Map("<leader>o", Cmd "tabnext")

-- Packer
Map("<leader>ps", Cmd "PackerSync")
