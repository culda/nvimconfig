-- no idea why neotree kills line numbers
vim.cmd("set number relativenumber")
vim.cmd(":Neotree reveal filesystem right")
vim.cmd("autocmd FileType qf wincmd J")
