local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'lewis6991/impatient.nvim',
        'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
    }

    -- Tree-sitter
    use 
    {
        'nvim-treesitter/nvim-treesitter',
        kfg = 'tree-sitter',
        event = "InsertEnter"
    }

    -- Hydra
    use {
        'anuvyklack/hydra.nvim',
        config = kfg 'hydra',
        requires = 'anuvyklack/keymap-layer.nvim'
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        kfg = 'telescope',
        cmd = "Telescope"
    }

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        tag = 'nightly',
        config = kfg 'tree',
        cmd = "NvimTreeToggle"
    }

end,
config = {
    git = { clone_timeout = nil }
} })
