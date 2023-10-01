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
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ['<C-k>'] = actions.move_selection_previous,
          ['<C-j>'] = actions.move_selection_next,
        },
      },
    },
    git_diffs = {
      git_command = { "git", "log", "--oneline", "--decorate", "--all", "." }
    },
  },
}

telescope.load_extension('fzf')
telescope.load_extension('frecency')
telescope.load_extension('file_browser')
telescope.load_extension('git_diffs')

vim.keymap.set('n', '<leader>pf', '<Cmd>Telescope frecency workspace=CWD<CR>', {})
vim.keymap.set('n', '<leader>pv', '<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
