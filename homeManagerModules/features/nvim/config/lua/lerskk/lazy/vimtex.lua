return {
  'lervag/vimtex',
  ft = 'tex',
  init = function()
    vim.keymap.set('n', '<leader>v', '<cmd>VimtexView<CR>')
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = 'zathura_simple'
    vim.g.vimtex_quickfix_mode = 0

    vim.g.tex_conceal = "abdmg"
  end
}
