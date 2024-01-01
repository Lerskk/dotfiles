local lsp = require('lsp-zero').preset({ name = 'recommended' })

lsp.ensure_installed {
  'html',
  'jsonls',
  'tsserver',
  'eslint',
  'lua_ls',
  'prismals',
  'tailwindcss',
  'cssls',
  'clangd'
}

local builtin = require('telescope.builtin')

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local opts = { buffer = bufnr }

  vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
  vim.keymap.set("n", "gr", builtin.lsp_references, opts)
  vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
  -- vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>fp", "<cmd>:!bunx prettier -w %<CR>", opts)
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

local null_ls = require('null-ls')

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
  sources = {
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.prismaFmt
  }
})

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
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
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  mapping = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(cmp_select), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(cmp_select), { 'i', 'c' }),
    ['<C-y>'] = cmp.mapping(cmp.mapping.confirm(), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c' }),
  }),
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
}

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

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
