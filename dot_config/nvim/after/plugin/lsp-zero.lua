local lsp = require('lsp-zero').preset({ name = 'recommended' })

lsp.ensure_installed {
  'html',
  'jsonls',
  'tsserver',
  'eslint',
  'lua_ls',
  'prismals',
  'tailwindcss',
}

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr }

  vim.keymap.set("n", "<leader>br", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.format_on_save {
  servers = {
    ['lua_ls'] = { 'lua' },
    ['tsserver'] = { 'typescript' },
  }
}

lsp.setup()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local lspkind = require('lspkind')

cmp.setup {
  formatting = {
    format = lspkind.cmp_format {
      mode = 'symblo_text',
      maxwidth = 50,
      ellipsis_char = '...',
    }
  },
  mapping = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(cmp_select), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(cmp_select), { 'i', 'c' }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.confirm(), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c' }),
  }),
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
}

cmp.setup.cmdline({ '/', '?' }, {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  -- mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})
