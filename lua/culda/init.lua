vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("culda.lazy")
require('culda.set')

-- Plugin configurations
-- require('nvim-tree').setup(
--   {
--     git = {
--       ignore = false, -- This will show git-ignored files
--     },
--   }
-- )

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

require('avante').setup({
  auto_suggestions_provider = "copilot",
})

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

require('blame').setup()
