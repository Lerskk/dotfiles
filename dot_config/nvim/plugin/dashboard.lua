local status, dashboard = pcall(require, 'dashboard')
if (not status) then return end

dashboard.setup {
  theme = 'hyper',
  shortcut_type = 'number',
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Apps',
        group = 'DiagnosticHint',
        action = 'Telescope app',
        key = 'a',
      },
      {
        desc = ' dotfiles',
        group = 'Number',
        action = 'Telescope dotfiles',
        key = 'd',
      },
    },
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dashboard',
  callback = function(opt)
    vim.keymap.set('n', 'q', function()
      if vim.bo[opt.buf] == 'dashboard' then
        vim.cmd('quit')
      end
    end, { buffer = opt.buf, remap = true })
  end
})
