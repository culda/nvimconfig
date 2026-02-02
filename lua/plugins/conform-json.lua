return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      json = { "jq" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
    formatters = {
      jq = {
        command = "jq",
        args = { "." },
      },
    },
  },
}
