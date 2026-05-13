return {
  -- Colorscheme (LazyVim default is tokyonight, which you already use)
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    },
  },

  -- Snacks explorer: use as default file explorer
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = true,
        replace_netrw = true,
      },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
          files = {
            hidden = true,
            ignored = false,
          },
        },
      },
    },
  },

  -- Neo-tree: disabled in favor of snacks explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  -- Git
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    opts = {},
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    opts = {},
  },

  -- Supermaven (AI completion)
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    opts = {},
  },

  -- Format on save
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
    },
  },

}
