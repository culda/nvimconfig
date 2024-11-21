local Remap = require("culda.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>gb", '<cmd>BlameToggle<CR>')
nnoremap("<leader>ng", '<cmd>Neogit<CR>', { noremap = true, silent = true })
nnoremap("<leader>gd", '<cmd>DiffviewOpen<CR>')
nnoremap("<leader>gq", '<cmd>DiffviewClose<CR>')
nnoremap("<leader>gdm", '<cmd>DiffviewOpen origin/main -- %<CR>')
nnoremap('<C-n>', ':Neotree filesystem right<CR>', { silent = true })
nnoremap('<C-l>', ':Neotree reveal filesystem right<CR>', { silent = true })
nnoremap('<C-h>', ':Neotree toggle<CR>', { silent = true })
nnoremap('<C-b>', ':Neotree buffers<CR>', { silent = true })

nnoremap("<leader>pv", ":Ex<CR>")

nnoremap("j", "k")
nnoremap("k", "j")

vnoremap("j", "k")
vnoremap("k", "j")

vnoremap("K", ":m '>+1<CR>gv=gv")
vnoremap("J", ":m '<-2<CR>gv=gv")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- greatest remap ever
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

vnoremap("<leader>d", "\"_d")

-- This is going to get me cancelled
inoremap("<C-c>", "<Esc>")

nnoremap("Q", "<nop>")
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
nnoremap("<leader>f", function()
    vim.lsp.buf.format({
      timeout_ms = 5000
    })
end)

nnoremap("<C-k>", "<cmd>cnext<CR>zz")
nnoremap("<C-j>", "<cmd>cprev<CR>zz")
nnoremap("<leader>k", "<cmd>lnext<CR>zz")
nnoremap("<leader>j", "<cmd>lprev<CR>zz")

nnoremap("<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

