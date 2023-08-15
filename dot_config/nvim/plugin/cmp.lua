-- nvim-cmp
local status, cmp = pcall(require, 'cmp')
if (not status) then return end

local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

cmp.setup {
  -- format the autocomplete menu
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
      return vim_item
    end
  },

  window = {
    completion = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-5),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<tab>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },

  sources = {
    { name = 'luasnip', max_item_count = 4 },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer',  max_item_count = 4 },
  },
}
