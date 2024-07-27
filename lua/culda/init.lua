require('culda.set')

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
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
  use("glepnir/lspsaga.nvim")
  use("romgrk/nvim-treesitter-context")
  use("simrat39/symbols-outline.nvim")

  -- Autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use("hrsh7th/cmp-buffer")
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use("tzachar/cmp-tabnine", { run = "./install.sh", requires = 'hrsh7th/nvim-cmp' })


  -- LSP
  use 'neovim/nvim-lspconfig'
  use("onsails/lspkind-nvim")

  -- Git integration
  use 'lewis6991/gitsigns.nvim'

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

require('telescope').setup()


require('lualine').setup()

require('gitsigns').setup()

require('Comment').setup()

require('nvim-autopairs').setup()

require('ibl').setup()

-- Color scheme
vim.cmd[[colorscheme tokyonight]]

-- Key mappings
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Basic settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true

