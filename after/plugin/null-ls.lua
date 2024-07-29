local null_ls = require("null-ls")

print("loading null-ls")

local b = null_ls.builtins

local sources = {
  -- b.formatting.gofumpt,
  b.formatting.goimports,
  b.diagnostics.golangci_lint,
}

null_ls.setup({
    sources = sources,
    debug = true,
    on_attach = function(client)
        print("null-ls attached")
        print("null-ls formatting capability:", client.server_capabilities.documentFormattingProvider)
    end,
})
