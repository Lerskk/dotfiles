local status, swap = pcall(require, 'sibling-swap')
if (not status) then return end

swap.setup {
  keymaps = {
    ['<C-.>'] = 'swap_with_right',
    ['<C-,>'] = 'swap_with_left',
    ['<space>.'] = 'swap_with_right_with_opp',
    ['<space>,'] = 'swap_with_left_with_opp',
  },
}
