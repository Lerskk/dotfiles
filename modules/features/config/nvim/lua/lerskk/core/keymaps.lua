local keymap = vim.keymap.set
opt = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("v", "J", ":m >+1<CR>gv=gv")
keymap("v", "K", ":m <-2<CR>gv=gv")

-- remap for dealing with word wrap
keymap({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap({ "n", "v" }, "^", "v:count == 0 ? 'g^' : '^'", { expr = true, silent = true })
keymap({ "n", "v" }, "$", "v:count == 0 ? 'g$' : '$'", { expr = true, silent = true })
