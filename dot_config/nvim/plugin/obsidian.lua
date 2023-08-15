local status, obsidian = pcall(require, 'obsidian')
if (not status) then end return

obsidian.setup {
  dir = '~/notes',
  completion = {
    nvim_cmp = true,
  },
}
