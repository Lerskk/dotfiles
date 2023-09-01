local telescope_status, telescope = pcall(require, 'telescope')
if not telescope_status then return end

local actions_status, actions = pcall(require, 'telescope.actions')
if not actions_status then return end

local builtin_status, builtin = pcall(require, 'telescope.builtin')
if not actions_status then return end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  }
}

telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})

