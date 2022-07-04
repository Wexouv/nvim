local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'lewis6991/impatient.nvim',
        'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
    }
    -- Lsp
    use {
        'neovim/nvim-lspconfig',
        config = kfg 'lsp'
    }

    use {
        { 'hrsh7th/cmp-nvim-lsp', config = kfg 'cmp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/nvim-cmp' },
        { 'L3MON4D3/LuaSnip'},
        { 'saadparwaiz1/cmp_luasnip'},
    }

    -- Tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = kfg 'treesitter',
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
        config = kfg 'telescope',
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
