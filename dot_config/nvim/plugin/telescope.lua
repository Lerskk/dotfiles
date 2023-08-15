local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        preview_width = 0.6,
      },
      vertical = {
        width = 0.9,
        height = 0.75,
        preview_height = 0.5,
      },
    },
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      disable_netrw = true,
      hijack_netrw = true,
      view = {
        number = true,
        relativenumber = true,
      },
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["n"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

local key = vim.keymap.set


key('n', '<leader><leader>f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)

key("n", "<leader>f", function()
  telescope.extensions.file_browser.file_browser({
    hidden = true,
    path = "%:p:h",
    grouped = true,
    initial_mode = "normal",
  })
end)

key('n', '<leader><leader>r', function() builtin.live_grep() end)

key('n', '\\\\', function() builtin.buffers() end)

key('n', '<leader><leader>t', function() builtin.help_tags() end)

key('n', '<leader><leader>;', function() builtin.resume() end)

key('n', '<leader><leader>e', function() builtin.diagnostics() end)
