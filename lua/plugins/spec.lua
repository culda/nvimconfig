return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons', -- optional, for file icons
  --   },
  --   lazy = false,
  -- },
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
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = "all",
        sync_install = false,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  {
    'romgrk/nvim-treesitter-context',
    lazy = false,
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
    'hrsh7th/cmp-path',
    lazy = false,
  },
  {
    'hrsh7th/cmp-cmdline',
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
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
    },
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
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
    'FabijanZulj/blame.nvim',
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
