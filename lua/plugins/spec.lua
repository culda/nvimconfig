return {
  -- Colorscheme (LazyVim default is tokyonight, which you already use)
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
    },
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

  -- Supermaven (AI completion)
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    opts = {},
  },
}
