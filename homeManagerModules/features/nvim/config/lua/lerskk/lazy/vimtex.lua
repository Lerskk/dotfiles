return {
  'lervag/vimtex',
  lazy = false,
  ft = 'tex',
  init = function()
    vim.keymap.set('n', '<leader>v', '<cmd>VimtexView<CR>')
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = 'zathura_simple'
    vim.g.vimtex_quickfix_mode = 0

    vim.g.tex_conceal = "abdmg"

    -- Force latexmk to use biber
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-pdf",
        "-bibtex"
      }
    }
  end
}
