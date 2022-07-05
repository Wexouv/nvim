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
        -- Lsp configuration
        {
            'neovim/nvim-lspconfig',
            config = kfg 'lsp',
            event = "InsertEnter"
        },
        -- LspInstaller
        {
            "williamboman/nvim-lsp-installer",
        }, 
        -- LspSaga
        {
            'kkharji/lspsaga.nvim',
            cmd = "Lspsaga"
        },
        -- Signature help
        {
            'ray-x/lsp_signature.nvim',
            config = kfg 'signature',
            after = "nvim-lspconfig"
        }
    }

    -- Auto completion and code analiz
    use {
        -- Candy
        { 'onsails/lspkind.nvim',  after = 'nvim-lspconfig' },

        -- Completion and sources
        { 'hrsh7th/nvim-cmp', config = kfg 'cmp', after = "lspkind.nvim" },
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

    -- Debugger
    use 
    {
        { 
            'mfussenegger/nvim-dap', 
            config = kfg 'dap',
            keys = "<leader>gg"
        },
        {
            "rcarriga/nvim-dap-ui",
            config = kfg 'dapui',
            after = 'nvim-dap'
        }
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

    use {
        'ggandor/lightspeed.nvim',
        keys = { 's', 'S', 'f', 'F' },
        config = kfg 'speed'
    }

    -- Hydra
    use 
    {
        {
            'anuvyklack/keymap-layer.nvim',
        },
        {
            'anuvyklack/hydra.nvim',
            config = kfg 'hydra'
        }
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

    -- Rest
    use {
        "NTBBloodbath/rest.nvim",
        config = kfg 'rest'
    }
end,
config = {
    git = { clone_timeout = nil }
} })
