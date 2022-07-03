local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'lewis6991/impatient.nvim',
        'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
    }

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        tag = 'nightly'
    }

end,
config = {
    git = { clone_timeout = nil }
} })
