return {
  -- Ensure oxlint is installed via Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "oxlint",
      },
    },
  },

  -- Configure nvim-lint to use oxlint for JS/TS files
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "oxlint" },
        javascriptreact = { "oxlint" },
        typescript = { "oxlint" },
        typescriptreact = { "oxlint" },
      },
    },
  },
}
