local keymap = require("culda.keymap")

-- Avante keybindings
keymap.nnoremap("<leader>as", "<cmd>AvanteStop<CR>", { desc = "Stop Avante" })
keymap.nnoremap("<leader>aa", "<cmd>AvanteAsk<CR>", { desc = "Ask Avante" })
keymap.nnoremap("<leader>ar", "<cmd>AvanteRefresh<CR>", { desc = "Refresh Avante" })

return {}
