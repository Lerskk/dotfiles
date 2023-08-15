local status, mason = pcall(require, 'mason')
if (not status) then return end
require('mason-lspconfig').setup()

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}
