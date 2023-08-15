local status, ls = pcall(require, 'luasnip')
if (not status) then return end

ls.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
  store_selection_keys = '<Tab>',
})

vim.keymap.set({ 'i', 's' }, '<C-u>', function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ 'i', 's' }, '<C-e>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })


vim.keymap.set({ 'i'}, '<C-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/plugin/luasnip.lua<CR>')

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets/"})
