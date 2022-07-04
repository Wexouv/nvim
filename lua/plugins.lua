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
        config = kfg 'lsp',
        event = "InsertEnter"
    }

    -- Auto completion and code analiz
    use {
        { 'hrsh7th/nvim-cmp', config = kfg 'cmp', after = "nvim-lspconfig" },
        { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" },
        { 'hrsh7th/cmp-buffer', after = "nvim-cmp" },
        { 'hrsh7th/cmp-path', after = "nvim-cmp" },
        { 'hrsh7th/cmp-cmdline', after = "nvim-cmp" },
        { 'L3MON4D3/LuaSnip', after = "nvim-cmp"},
        { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" },
    }

    -- Tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = kfg 'treesitter',
        after = "cmp_luasnip"
    }
        
    use { "ellisonleao/gruvbox.nvim", after = "nvim-treesitter", 
    config = function()
        require("gruvbox").setup({
          inverse = true,
          invert_selection = false,
          contrast = "hard",
        })
    vim.cmd("colorscheme gruvbox")
    end
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
