local Remap = require("culda.keymap")
local lspconfig = require("lspconfig")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
  youtube = "[Suck it YT]",
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  -- cmp_tabnine = "[TN]",
  path = "[Path]",
}
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      -- vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      require("luasnip").lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      -- if entry.source.name == "cmp_tabnine" then
      --   if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
      --     menu = entry.completion_item.data.detail .. " " .. menu
      --   end
      --   vim_item.kind = "@"
      -- end
      vim_item.menu = menu
      return vim_item
    end,
  },

  sources = {
    { name = "nvim_lsp" },

    -- For vsnip user.
    -- { name = 'vsnip' },

    -- For luasnip user.
    { name = "luasnip" },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = "buffer" },

    { name = "youtube" },
  },
})

-- local tabnine = require("cmp_tabnine.config")
-- tabnine:setup({
--   max_lines = 1000,
--   max_num_results = 20,
--   sort = true,
--   run_on_every_keystroke = true,
--   snippet_placeholder = "..",
-- })

local function config(_config)
  return vim.tbl_deep_extend("force", {
    on_attach = function()
      nnoremap("gd", function() vim.lsp.buf.definition() end)
      nnoremap("gD", function() vim.lsp.buf.declaration() end)
      nnoremap("K", function() vim.lsp.buf.hover() end)
      nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
      nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
      nnoremap("[d", function() vim.diagnostic.goto_next() end)
      nnoremap("]d", function() vim.diagnostic.goto_prev() end)
      nnoremap("<leader>ca", function() vim.lsp.buf.code_action() end)
      nnoremap("<leader>co", function()
        vim.lsp.buf.code_action({
          filter = function(code_action)
            if not code_action or not code_action.data then
              return false
            end

            local data = code_action.data.id
            return string.sub(data, #data - 1, #data) == ":0"
          end,
          apply = true
        })
      end)
      nnoremap("gi", function() vim.lsp.buf.references() end)
      nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
      inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
    end,
  }, _config or {})
end

require("mason").setup {}

require("mason-lspconfig").setup {
  ensure_installed = {
    "pyright",
    "eslint",
    "solidity",
    "solidity_ls",
    "efm",
    "jsonls"
  },
  automatic_installation = true,
}

lspconfig.pyright.setup(config())

lspconfig.zls.setup(config())

lspconfig.ts_ls.setup(config({
  init_options = {
    preferences = {
      importModuleSpecifierPreference = 'non-relative',
    }
  },
}))

lspconfig.eslint.setup(config({
  settings = {
    codeActionOnSave = {
      enable = true,
      mode = "all"
    },
  }
}))

lspconfig.jsonls.setup(config())

lspconfig.ccls.setup(config())

-- require("lspconfig").jedi_language_server.setup(config())

lspconfig.svelte.setup(config())

-- lspconfig.solang.setup(config({
--   filetypes = { "solidity" },
--   -- cmd = { "vscode-solidity-server", "--stdio" },
--   root_dir = require("lspconfig.util").root_pattern("foundry.toml", ".git"),
--   settings = {
--     solang = {
--       importmap = {
--         ["@openzeppelin"] = "lib/openzeppelin-contracts/contracts"
--       }
--     }
--   }
-- }))

lspconfig.solidity.setup(config({
  filetypes = { "solidity" },
  cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
  root_dir = require("lspconfig.util").root_pattern("foundry.toml", ".git"),
  settings = {
    solidity = {
      includePath = '',
      remappings = {
        ["@openzeppelin/"] = "lib/openzeppelin-contracts/",
        ["account-abstraction/"] = "lib/account-abstraction/"
      }
    }
  }
}))

lspconfig.cssls.setup(config())

lspconfig.gopls.setup(config({
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
  on_attach = function(_, bufnr)
    -- Call the local on_attach logic
    config().on_attach()

    -- Add Go-specific keybinding only for Go files
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>got', ':GoTestFile -v <CR>',
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>got', ':vert copen 40<CR>', { noremap = true, silent = true })
  end,
}))

-- who even uses this?
lspconfig.rust_analyzer.setup(config({
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
  --[[
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    }
    --]]
}))

lspconfig.lua_ls.setup(config({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}))

local solhint = require("efmls-configs.linters.solhint")
local prettier_d = require("efmls-configs.formatters.prettier_d")
local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")
local flake8 = require("efmls-configs.linters.flake8")
local black = require("efmls-configs.formatters.black")
local eslint = require("efmls-configs.linters.eslint")
local fixjson = require("efmls-configs.formatters.fixjson")
local shellcheck = require("efmls-configs.linters.shellcheck")
local shfmt = require("efmls-configs.formatters.shfmt")
local hadolint = require("efmls-configs.linters.hadolint")
local cpplint = require("efmls-configs.linters.cpplint")
local clangformat = require("efmls-configs.formatters.clang_format")

-- configure efm server
lspconfig.efm.setup({
  filetypes = {
    "solidity",
    "lua",
    "python",
    "json",
    "jsonc",
    "sh",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte",
    "vue",
    "markdown",
    "docker",
    "html",
    "css",
    "c",
    "cpp",
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true,
  },
  settings = {
    languages = {
      solidity = { solhint, prettier_d },
      lua = { luacheck, stylua },
      python = { flake8, black },
      typescript = { eslint, prettier_d },
      json = { eslint, fixjson },
      jsonc = { eslint, fixjson },
      sh = { shellcheck, shfmt },
      javascript = { eslint, prettier_d },
      javascriptreact = { eslint, prettier_d },
      typescriptreact = { eslint, prettier_d },
      svelte = { eslint, prettier_d },
      vue = { eslint, prettier_d },
      markdown = { prettier_d },
      docker = { hadolint, prettier_d },
      html = { prettier_d },
      css = { prettier_d },
      c = { clangformat, cpplint },
      cpp = { clangformat, cpplint },
    },
  },
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

local opts = {
  -- whether to highlight the currently hovered symbol
  -- disable if your cpu usage is higher than you want it
  -- or you just hate the highlight
  -- default: true
  highlight_hovered_item = true,

  -- whether to show outline guides
  -- default: true
  show_guides = true,
}

require("symbols-outline").setup(opts)

local snippets_paths = function()
  local plugins = { "friendly-snippets" }
  local paths = {}
  local path
  local root_path = vim.env.HOME .. "/.vim/plugged/"
  for _, plug in ipairs(plugins) do
    path = root_path .. plug
    if vim.fn.isdirectory(path) ~= 0 then
      table.insert(paths, path)
    end
  end
  return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
  paths = snippets_paths(),
  include = nil, -- Load all languages
  exclude = {},
})

-- require("mason-null-ls").setup({
--   ensure_installed = { "black", "eslint", "prettier_d", "solhint" },
--   automatic_installation = true,
-- })

-- local null_ls = require("null-ls")

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.diagnostics.golangci_lint,
--     null_ls.builtins.formatting.black,
--     null_ls.builtins.diagnostics.solhint,
--     null_ls.builtins.formatting.prettierd.with({
--       filetypes = { "solidity", "javascript", "typescript", "css", "html", "json" }
--     })
--     -- null_ls.builtins.code_actions.eslint_d,
--     -- null_ls.builtins.code_actions.eslint
--   },
--   debug = true,
-- })

-- cleras the lightbulb
require('lspsaga').setup({ ui = { enable = false, code_action = "" } })
