local Remap = require("culda.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap

nnoremap("<leader>m", function() require("culda.llm.llm").create_llm_md() end, { desc = "Create llm.md" })
-- keybinds for prompting with openai
nnoremap("<leader>g,", function() require("culda.llm.llm").prompt({ replace = false, service = "openai" }) end, { desc = "Prompt with openai" })
vnoremap("<leader>g,", function() require("culda.llm.llm").prompt({ replace = false, service = "openai" }) end, { desc = "Prompt with openai" })
vnoremap("<leader>g.", function() require("culda.llm.llm").prompt_with_input({ replace = true, service = "openai" }) end, { desc = "Prompt while replacing with openai" })
