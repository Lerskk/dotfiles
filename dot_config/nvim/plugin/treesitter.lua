local status, TS = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

TS.setup {
  ensure_installed = { "c", "lua", "python", 'astro', 'css', 'glimmer', 'graphql', 'html', 'javascript',
    'lua', 'php', 'python', 'scss', 'svelte', 'tsx', 'twig',
    'typescript', 'vim', 'vue', },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  -- highlight = {
  --   enable = true,
  -- additional_vim_regex_highlighting = { "markdown" },
  -- disable = { "latex" }
  -- },
  -- rainbow = {
  --   enable = true,
  -- }
}
