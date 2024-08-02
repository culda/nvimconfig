require('culda.set')
require('culda.auto')

-- Bootstrap Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Plugin specifications
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires =  {'nvim-lua/plenary.nvim'}
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
  use ({
      'nvimdev/lspsaga.nvim',
      after = 'nvim-lspconfig',
      config = function()
          require('lspsaga').setup({})
      end,
  })
  use("romgrk/nvim-treesitter-context")
  use("simrat39/symbols-outline.nvim")

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use("hrsh7th/cmp-buffer")
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use("tzachar/cmp-tabnine", { run = "./install.sh", requires = 'hrsh7th/nvim-cmp' })

  -- Go
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support
  -- use({
  --   "jose-elias-alvarez/null-ls.nvim",
  --   -- config = function()
  --   --     local null_ls = require("null-ls")
  --   --     null_ls.setup({
  --   --       sources = {
  --   --         -- null_ls.builtins.formatting.gofumpt,
  --   --         null_ls.builtins.formatting.goimports,
  --   --         null_ls.builtins.diagnostics.golangci_lint,
  --   --       },
  --   --       debug = true,
  --   --       on_attach = function(client)
  --   --           print("null-ls attached")
  --   --           print("null-ls formatting capability:", client.server_capabilities.documentFormattingProvider)
  --   --       end,
  --   --     })
  --   -- end,
  --   requires = { "nvim-lua/plenary.nvim" },
  -- })


  -- LSP
  use 'neovim/nvim-lspconfig'
  use("onsails/lspkind-nvim")

  -- Git integration
  use 'lewis6991/gitsigns.nvim'
  use({
    "TimUntersberger/neogit",
    requires = {
      "sindrets/diffview.nvim"
    }
  })

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Color scheme
  use 'folke/tokyonight.nvim'
  use({"catppuccin/nvim", as = "catppuccin" })
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- Commenting
  use 'numToStr/Comment.nvim'

  -- Autopairs
  use 'windwp/nvim-autopairs'

  -- Indent guides
  use 'lukas-reineke/indent-blankline.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Plugin configurations
require('nvim-tree').setup()

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-d>"] = "delete_buffer",
      },
    },
  },
})

require('lualine').setup()

require('gitsigns').setup()

require('neogit').setup({
  integrations = {
    diffview = true
  }
})

require('Comment').setup()

require('nvim-autopairs').setup()

require('ibl').setup()

require('go').setup()

require('culda.llm.llm').setup({
    -- How long to wait for the request to start returning data.
    timeout_ms = 10000,
    services = {
        -- Supported services configured by default
        -- groq = {
        --     url = "https://api.groq.com/openai/v1/chat/completions",
        --     model = "llama3-70b-8192",
        --     api_key_name = "GROQ_API_KEY",
        -- },
        openai = {
            url = "https://api.openai.com/v1/chat/completions",
            model = "gpt-4o",
            api_key_name = "OPENAI_API_KEY",
        }
        -- anthropic = {
        --     url = "https://api.anthropic.com/v1/messages",
        --     model = "claude-3-5-sonnet-20240620",
        --     api_key_name = "ANTHROPIC_API_KEY",
        -- },

        -- Extra OpenAI-compatible services to add (optional)
        -- other_provider = {
        --     url = "https://example.com/other-provider/v1/chat/completions",
        --     model = "llama3",
        --     api_key_name = "OTHER_PROVIDER_API_KEY",
        -- }
    }
})

-- Color scheme
vim.cmd[[colorscheme tokyonight]]

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':NvimTreeFindFile<CR>', {noremap = true, silent = true})

-- Basic settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true

