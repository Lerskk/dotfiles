local keymap = vim.keymap.set

vim.g.mapleader = ","
vim.g.maplocalleader = ","

keymap('n', 'x', '"_x')

-- increment/decrement
keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

-- delete/change a word backwards
keymap('n', 'dw', 'vb"_d')
keymap('n', 'cw', 'vb"_c')
keymap('n', 'yw', 'vbye')

-- select all
keymap('n', '<C-a>', 'gg<S-v>G')

-- save without formatting
keymap('n', '<leader>nf', ':noautocmd w', { silent = true })

-- new tab
keymap('n', 'te', ':tabedit<CR>', { silent = true })
keymap('n', '<Tab>', ':tabnext<CR>', { silent = true })
keymap('n', '<S-Tab>', ':tabprevious<CR>', { silent = true })
keymap('n', 'ss', ':split<Return><C-w>w')
keymap('n', 'sv', ':vsplit<Return><C-w>w')

-- move window

keymap('n', '<Space><Space>', '<C-w>w')
keymap('', 'sh', '<C-w>h')
keymap('', 'sk', '<C-w>k')
keymap('', 'sj', '<C-w>j')
keymap('', 'sl', '<C-w>l')

-- resize window
keymap('n', '<C-w><left>', '<C-w><')
keymap('n', '<C-w><right>', '<C-w>>')
keymap('n', '<C-w><up>', '<C-w>+')
keymap('n', '<C-w><down>', '<C-w>-')

-- cd
keymap('n', '<leader>cd', '<cmd>cd %:h<CR>')
keymap('n', '<leader>..', '<cmd>cd ..<CR>')


opt = { silent = true }
-- lsp
keymap('n', 'K', vim.lsp.buf.hover, opt)
keymap('n', 'gd', vim.lsp.buf.definition, opt)
keymap('n', 'gt', vim.lsp.buf.type_definition, opt)
keymap('n', 'gi', vim.lsp.buf.implementation, opt)
keymap('n', '<leader>ca', vim.lsp.buf.code_action, opt)
keymap('n', '<leader>r', vim.lsp.buf.rename, opt)
keymap('n', '<leader>d', vim.diagnostic.open_float, opt)
keymap('n', '<leader>nd', vim.diagnostic.goto_next, opt)
keymap('n', '<leader>pd', vim.diagnostic.goto_prev, opt)
keymap('n', '<leader>ld', '<cmd>Telescope diagnostics<CR>', opt)

keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>')

-- obsidian
keymap(
  "n",
  "gh",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true }
)

-- Set key mappings for Vimtex
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>VimtexClean<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gl', ':VimtexView<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lt', ':VimtexToggle<CR>', { noremap = true, silent = true })
