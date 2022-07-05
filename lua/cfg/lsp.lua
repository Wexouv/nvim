local lspconfig = require("lspconfig")
local lspinstaller = require("nvim-lsp-installer")
local sqls = require('sqls')


lspconfig.omnisharp.setup {}
lspconfig.tsserver.setup {}
lspinstaller.setup {}

lspconfig.sqls.setup {
    on_attach = function(client, bufnr)
        sqls.on_attach(client, bufnr)
    end,
    settings = {
        sqls = {
            connections = {
                {
                    driver = 'sqlite3',
                    dataSourceName = '/home/iz/test/db.db',
                },
            },
        },
    },

}
