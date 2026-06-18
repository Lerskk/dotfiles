vim.keymap.set("n", "<leader>v", function() vim.cmd("VimtexView") end)
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "zathura_simple"
vim.g.vimtex_quickfix_mode = 0
vim.g.tex_conceal = "abdmg"
vim.g.vimtex_compiler_progname = "nvr"
vim.g.vimtex_compiler_latexmk_engines = {
  _ = "-lualatex"
}

vim.g.vimtex_compiler_latexmk = {
  options = {
    "-lualatex",
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonestopemode",
    "-bibtex"
  }
}

