local lspconfig = require("lspconfig")
local lspinstaller = require("nvim-lsp-installer")

lspinstaller.setup {}
lspconfig.omnisharp.setup {}
lspconfig.tsserver.setup {}
lspinstaller.setup {}
