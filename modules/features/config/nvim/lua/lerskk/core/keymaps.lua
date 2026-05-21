local keymap = vim.keymap.set
opt = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("v", "J", ":m >+1<CR>gv=gv")
keymap("v", "K", ":m <-2<CR>gv=gv")

