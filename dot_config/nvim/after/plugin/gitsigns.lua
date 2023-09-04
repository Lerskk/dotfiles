local git = require('gitsigns')

git.setup {
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 200,
  },
}
