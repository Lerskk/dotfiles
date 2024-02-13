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
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["ai"] = '@conditional.outer',
            ["ii"] = '@conditional.inner',
            ["al"] = '@loop.outer',
            ["il"] = '@loop.inner',
            ["at"] = '@comment.outer',
            ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          },
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
