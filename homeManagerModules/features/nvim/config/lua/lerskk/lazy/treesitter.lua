return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',

    dependencies = {
      'nvim-treesitter/playground',
      "nvim-treesitter/nvim-treesitter-textobjects",
    },

    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_install = 'all',

        sync_install = false,
        -- auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'markdown' },
          disable = { "latex" },
        },

        playground = {
          enable = true,
          disable = {},
          updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        },
        textobjects = {

          select = {
            enable = true,
            lookahead = true,

            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
            },
          },

          move = {
            enable = true,
            set_jumps = true,

            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]c"] = "@class.outer",
            },

            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[c"] = "@class.outer",
            },

            goto_next_end = {
              ["]M"] = "@function.outer",
            },

            goto_previous_end = {
              ["[M"] = "@function.outer",
            },
          },

          swap = {
            enable = true,
            swap_next = {
              ["<leader>s"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>S"] = "@parameter.inner",
            },
          },
        },
      }

      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },

    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 3,
        min_window_height = 10,
        mode = "cursor",
        trim_scope = "outer",
        multiline_threshold = 20,
        separator = "─",
      })
    end,
  },
}
