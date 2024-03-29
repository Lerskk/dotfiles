return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',

  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },

  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = {
        'bash',
        'comment',
        'cpp',
        'css',
        'diff',
        'dockerfile',
        'fish',
        'gitignore',
        'html',
        'json',
        "latex",
        "javascript",
        "markdown",
        'markdown_inline',
        'prisma',
        "python",
        'racket',
        'scss',
        'sql',
        'svelte',
        'vue',
        'tsx',
        "typescript",
        'yaml',
        'yuck', -- eww
        'php',
      },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
      },


      textobjects = {
        select = {
          enable = true,

          lookahead = true,

          keymaps = {
            ['af'] = { query = '@function.outer', desc = 'outer function' },
            ['if'] = { query = '@function.inner', desc = 'inner function' },
            ['ac'] = { query = '@conditional.outer', desc = 'outer conditional' },
            ['ic'] = { query = '@conditional.inner', desc = 'inner conditional' },
            ['al'] = { query = '@loop.outer', desc = 'outer loop' },
            ['il'] = { query = '@loop.inner', desc = 'inner loop' },
            ['am'] = { query = '@statement.outer', desc = 'outer statement' },
            ['ix'] = { query = '@comment.outer', desc = 'comment' },
          },
          include_surrounding_whitespace = false,
        },

        move = {
          enable = true,
          set_jumps = true,

          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>sa'] = '@parameter.inner'
          },
          swap_previous = {
            ['<leader>sA'] = '@parameter.inner'
          }
        },
        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V',  -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding or succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * selection_mode: eg 'v'
        -- and should return true of false
        include_surrounding_whitespace = true,
      },
    }
  end
}
