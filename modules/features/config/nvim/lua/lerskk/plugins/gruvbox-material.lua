vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_transparent_background = 0
vim.g.gruvbox_material_sign_column = 1

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "gruvbox-material",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "#111418" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#111418" })
  end,
})
