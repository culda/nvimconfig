return {
  -- Disable inlay hints by default for Go
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false, -- Disable inlay hints globally by default
      },
    },
  },
}
