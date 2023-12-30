local keymap = vim.keymap.set
opt = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap('n', '<leader>q', vim.cmd.q)
keymap('n', '<leader>w', vim.cmd.w)
keymap('n', '<leader>x', vim.cmd.x)

-- move code around
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

keymap('n', 'J', 'mzJ`z')
keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')

keymap('x', '<leader>p', '\'_dP')

keymap('n', '<leader>d', '\'_d')
keymap('v', '<leader>d', '\'_d')

-- save without formatting
keymap('n', '<leader>fw', ':noautocmd w', { silent = true })

-- new tab
keymap('n', '<leader>te', ':tabedit<CR>', { silent = true })
keymap('n', '<leader>cv', ':split<Return><C-w>w')
keymap('n', '<leader>ch', ':vsplit<Return><C-w>w')
