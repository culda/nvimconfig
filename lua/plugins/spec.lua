return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        lazy = false,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = false,
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        -- config = function()
        --     require("your.null-ls.config") -- require your null-ls config here (example below)
        -- end,
    },
    -- Syntax highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        -- config = function()
        --   require('nvim-treesitter.configs').setup {
        --     ensure_installed = "all",
        --     -- other settings...
        --   }
        -- end,
    },
    {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
            -- add options here
            -- or leave it empty to use the default settings
        },
        keys = {
            -- suggested keymap
            { "<leader>q", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    },
    {
        'nvimdev/lspsaga.nvim',
        lazy = false,
    },
    {
        'romgrk/nvim-treesitter-context',
        lazy = false,
    },
    {
        'simrat39/symbols-outline.nvim',
        lazy = false,
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        lazy = false,
    },
    {
        'hrsh7th/cmp-buffer',
        lazy = false,
    },
    {
        'L3MON4D3/LuaSnip',
        lazy = false,
    },
    {
        'saadparwaiz1/cmp_luasnip',
        lazy = false,
    },
    -- {
    --   'tzachar/cmp-tabnine',
    --   run = "./install.sh",
    --   dependencies = 'hrsh7th/nvim-cmp',
    --   lazy = false,
    -- },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        build = "make",
        opts = {
            -- add any opts here
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below is optional, make sure to setup it properly if you have lazy=true
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },

    -- Go
    {
        'ray-x/go.nvim',
        lazy = false,
    },
    {
        'ray-x/guihua.lua', -- recommended if need floating window support
        lazy = false,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
    },
    {
        'onsails/lspkind-nvim',
        lazy = false,
    },
    {
        'nvimtools/none-ls.nvim',
        lazy = false,
    },

    -- Git integration
    {
        'lewis6991/gitsigns.nvim',
        lazy = false,
    },
    {
        "TimUntersberger/neogit",
        dependencies = {
            "sindrets/diffview.nvim"
        },
        lazy = false,
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        lazy = false,
    },

    -- Color scheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme tokyonight]]
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
    },

    -- Commenting
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    -- Autopairs
    {
        'windwp/nvim-autopairs',
        lazy = false,
    },

    -- Indent guides
    {
        'lukas-reineke/indent-blankline.nvim',
        lazy = false,
    },
}
