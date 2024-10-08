return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.5',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'crispgm/telescope-heading.nvim',
    {
      'paopaol/telescope-git-diffs.nvim',
      dependencies = {
        'sindrets/diffview.nvim'
      }
    }
  },

  config = function()
    local telescope_status, telescope = pcall(require, 'telescope')
    if not telescope_status then return end

    local actions_status, actions = pcall(require, 'telescope.actions')
    if not actions_status then return end

    local builtin_status, builtin = pcall(require, 'telescope.builtin')
    if not actions_status then return end

    telescope.setup {
      defaults = {
        file_ignore_patterns = {
          'node_modules', '.git', '.next', 'dist' -- in addition to .gitignore
        },
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
          grouped = true,
          hidden = true,
          mappings = {
            ['i'] = {
              ["<C-t>"] = function(prompt_bufnr)
                actions.change_cwd(prompt_bufnr)
                actions.close(prompt_bufnr)
              end,
            },
            ['n'] = {
              ["t"] = function(prompt_bufnr)
                actions.change_cwd(prompt_bufnr)
                actions.close(prompt_bufnr)
              end,
            },
          },
        },
        git_diffs = {
          git_command = { "git", "log", "--oneline", "--decorate", "--all", "." }
        },
      },
    }

    telescope.load_extension('file_browser')
    telescope.load_extension('git_diffs')
    telescope.load_extension("ui-select")
    telescope.load_extension("ui-select")
    telescope.load_extension('heading')


    vim.keymap.set('n', '<leader>?', builtin.keymaps, {})
    vim.keymap.set('n', '<leader>ff', function()
      builtin.find_files({
        hidden = true,
        no_ignore = true,
        no_ignore_parent = true,
      })
    end, {})
    vim.keymap.set('n', '<leader>fp', function()
      builtin.find_files({
        hidden = true,
        no_ignore = true,
        no_ignore_parent = true,
      })
    end, {})

    vim.keymap.set('n', '<leader>fr', '<Cmd>Telescope resume<CR>', {})
    vim.keymap.set('n', '<leader>fh', '<Cmd>Telescope heading<CR>', {})
    vim.keymap.set('n', '<leader>fs', '<Cmd>Telescope lsp_document_symbols<CR>', {})
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fv', '<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>', {})
    vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
  end
}
