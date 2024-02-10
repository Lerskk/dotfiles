return {
  'lewis6991/gitsigns.nvim',

  config = function()
    local git = require('gitsigns')
    git.setup {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
      },
      signcolumn = auto,
      on_attach = function()
        vim.wo.signcolumn = "yes"
      end
    }
  end
}
