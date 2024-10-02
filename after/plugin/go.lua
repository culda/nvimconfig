local create_autocmd = vim.api.nvim_create_autocmd
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})

create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

create_autocmd("BufWritePre", {
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
-- bad
-- vim.cmd[[autocmd BufWritePost *.go silent! !golangci-lint run %]]

