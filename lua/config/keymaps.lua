-- Keymaps are automatically loaded on the Lazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Swap j/k (your preference)
map("n", "j", "k", { desc = "Up" })
map("n", "k", "j", { desc = "Down" })
map("v", "j", "k", { desc = "Up" })
map("v", "k", "j", { desc = "Down" })

-- Move lines in visual mode
map("v", "K", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "J", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Center screen on navigation
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Better paste (don't overwrite register)
map("x", "<leader>p", '"_dP', { desc = "Paste without overwrite" })

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })

-- Delete without yanking
map("v", "<leader>d", '"_d', { desc = "Delete without yank" })

-- Escape in insert mode
map("i", "<C-c>", "<Esc>", { desc = "Escape" })

-- Disable Q
map("n", "Q", "<nop>")

-- tmux sessionizer
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Tmux sessionizer" })

-- Format
map("n", "<leader>f", function()
  require("conform").format({ timeout_ms = 5000, lsp_fallback = true })
end, { desc = "Format buffer" })

-- Quickfix navigation
map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next loclist" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev loclist" })

-- Search and replace word under cursor
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Search/replace word" })

-- Make file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make executable" })

-- Git
map("n", "<leader>gb", "<cmd>BlameToggle<CR>", { desc = "Git blame toggle" })
map("n", "<leader>ng", "<cmd>Neogit<CR>", { desc = "Neogit" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview open" })
map("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Diffview close" })
map("n", "<leader>gdm", "<cmd>DiffviewOpen origin/main -- %<CR>", { desc = "Diff vs main" })

-- File explorer
map("n", "<leader>pv", ":Ex<CR>", { desc = "Open netrw" })
