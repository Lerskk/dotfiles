-- lsp
local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local navic = require("nvim-navic")

local servers = { 'clangd', 'texlab', 'pyright', 'tsserver', 'tailwindcss' }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false
  }
)

local on_attach = function(client, bufnr)
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  -- check vim.diagnostic
end

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

nvim_lsp['lua_ls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
}
