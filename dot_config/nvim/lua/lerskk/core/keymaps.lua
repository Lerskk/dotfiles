local keymap = vim.keymap.set
opt = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap('n', '<leader>pv', vim.cmd.Ex)

-- save without formatting
keymap('n', '<leader>nf', ':noautocmd w', { silent = true })

-- new tab
keymap('n', '<leader>te', ':tabedit<CR>', { silent = true })
keymap('n', '<Tab>', ':tabnext<CR>', { silent = true })
keymap('n', '<S-Tab>', ':tabprevious<CR>', { silent = true })
keymap('n', '<leader>ss', ':split<Return><C-w>w')
keymap('n', '<leader>sv', ':vsplit<Return><C-w>w')

-- cd
keymap('n', '<leader>cd', '<cmd>cd %:h<CR>')
keymap('n', '<leader>..', '<cmd>cd ..<CR>')
