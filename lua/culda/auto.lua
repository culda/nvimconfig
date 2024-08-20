vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format({
      timeout_ms = 1000,
      filter = function(client)
        return client.name == "null-ls" and client.server_capabilities.documentFormattingProvider
      end
    })
  end,
}
)
