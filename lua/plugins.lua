local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'lewis6991/impatient.nvim', 'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',    'kyazdani42/nvim-web-devicons'
    }

    -- Lsp
    use {{
        'neovim/nvim-lspconfig',
        config = kfg 'lsp',
    },{
        "williamboman/nvim-lsp-installer",
    },{
        'kkharji/lspsaga.nvim',
    },{
        'ray-x/lsp_signature.nvim',
        config = kfg 'signature',
    }}

    -- Auto completion and code analiz
    use {
        -- Candy
        { 'onsails/lspkind.nvim' },

        -- Completion and sources
        { 'hrsh7th/nvim-cmp', config = kfg 'cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lua' }
    }

    -- Tree-sitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = kfg 'treesitter',
    }

    -- Debugger
    use 
    {{ 
        'mfussenegger/nvim-dap', 
        config = kfg 'dap',
    },{
        "rcarriga/nvim-dap-ui",
        config = kfg 'dapui',
    }}

    use { 
        "ellisonleao/gruvbox.nvim",
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
    use {{
        'anuvyklack/keymap-layer.nvim',
    },{
        'anuvyklack/hydra.nvim',
        config = kfg 'hydra'
    }}

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = kfg 'telescope',
    }

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        tag = 'nightly',
        config = kfg 'tree',
    }

    -- Rest
    use {
        "NTBBloodbath/rest.nvim",
        config = kfg 'rest'
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = false,
                indent_blankline_show_first_indent_level = false
            }
        end
    }

    -- Sql
    use {
        'nanotee/sqls.nvim',
    }

    -- Coplilot
    use {
        "zbirenbaum/copilot-cmp",
        module = "copilot_cmp",
    }
    use {
        "zbirenbaum/copilot.lua",
        event = {"VimEnter"},
        config = function()
            vim.defer_fn(function()
                require("copilot").setup( {
                cmp = {
                    enabled = true,
                    method = "getPanelCompletions",
                },
                panel = { -- no config options yet
                    enabled = true,
                },
            })
            end, 100)
    end,
    }
end,
config = {
        git = { clone_timeout = nil }
    }
})
