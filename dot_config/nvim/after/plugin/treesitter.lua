require 'nvim-treesitter.configs'.setup {

  -- A list of parser names, or "all"
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
    'yuck',                              -- eww
    'php',
    "c", "lua", "vim", "vimdoc", "query" -- (the five listed parsers should always be installed)
  },

  autotag = {
    enable = true,
    enable_close_on_slash = false,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },

}
