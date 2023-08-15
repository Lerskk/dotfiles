local status, git = pcall(require, 'gitsigns')
if (not status) then return end

git.setup {
  signcolumn = auto,
  on_attach = function()
    vim.wo.signcolumn = "yes"
  end
}
