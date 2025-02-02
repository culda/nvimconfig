local create_autocmd = vim.api.nvim_create_autocmd
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
local lsp_format_grp = vim.api.nvim_create_augroup("lsp_format", {})

-- create_autocmd("BufWritePre", {
--   group = lsp_format_grp,
--   callback = function()
--     local efm = vim.lsp.get_clients({ name = "efm" })
--
--     if vim.tbl_isempty(efm) then
--       return
--     end
--
--     vim.lsp.buf.format({name = "efm", async = true})
--   end,
-- })

-- create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--    require('go.format').goimports()
--   end,
--   group = format_sync_grp,
-- })
--
-- create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     vim.lsp.buf.format({
--       timeout_ms = 1000,
--       filter = function(client)
--         return client.name == "null-ls" and client.server_capabilities.documentFormattingProvider
--       end
--     })
--   end,
-- }
--
-- bad
-- vim.cmd[[autocmd BufWritePost *.go silent! !golangci-lint run %]]

