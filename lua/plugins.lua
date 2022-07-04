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

    use {
        'mfussenegger/nvim-dap',
        config = kfg 'dap',
    }

    use { 
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function()
            require("dapui").setup({
                icons = { expanded = "▾", collapsed = "▸" },
                mappings = {
                    -- Use a table to apply multiple mappings
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                expand_lines = vim.fn.has("nvim-0.7"),
                layouts = {
                    {
                        elements = {
                            -- Elements can be strings or table with id and size keys.
                            { id = "scopes", size = 0.25 },
                            "breakpoints",
                            "stacks",
                            "watches",
                        },
                        size = 40, -- 40 columns
                        position = "left",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 0.25, -- 25% of total lines
                        position = "bottom",
                    },
                },
                floating = {
                    max_height = nil, -- These can be integers or a float between 0 and 1.
                    max_width = nil, -- Floats will be treated as percentage of your screen.
                    border = "single", -- Border style. Can be "single", "double" or "rounded"
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 1 },
                render = {
                    max_type_length = nil, -- Can be integer or nil.
                }
            })
        end
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
