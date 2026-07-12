local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

local builtin = require("telescope.builtin")

require("telescope").setup({
  defaults = {
    layout_strategy = "flex",
    layout_config = {
      horizontal = { preview_width = 0.55 },
      vertical = { width = 0.9 },
    },

    file_ignore_patterns = {
      "node_modules", ".git", ".next", "dist" -- in addition to .gitignore
    },

    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<c-t>"] = open_with_trouble,
      },
      n = {
        ["<c-t>"] = open_with_trouble,
      },
    },
  },

  pickers = {
    find_files = { hidden = true },

    lsp_document_symbols = { symbols = { "function", "method", "class", "struct", "interface" } },
  },
})

local map = vim.keymap.set

map("n", "<leader>?", builtin.keymaps, {})
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fF", function()
  builtin.find_files({
    hidden = true,
    no_ignore = true,
    no_ignore_parent = true,
  })
end, {})
map("n", "<leader>fd", "<Cmd>Telescope lsp_document_symbols<CR>", {})
map("n", "<leader>fw", "<Cmd>Telescope lsp_workspace_symbols<CR>", {})

map("n", "gr", builtin.lsp_references, {})
map("n", "<leader>fr", "<Cmd>Telescope resume<CR>", {})
map("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>gf", builtin.git_files, {})
