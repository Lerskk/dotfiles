local obsidian = require('obsidian')
obsidian.setup({
  dir = "~/notes",

  completion = {
    nvim_cmp = true,
    min_chars = 0,
    new_notes_location = "current_dir",
    prepend_note_id = true
  },
})

vim.keymap.set('n', '<leader>of', '<cmd>ObsidianQuickSwitch<CR>', {})
vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', {})
vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', {})
vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianOpen<CR>', {})
