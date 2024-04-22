local M = {}

local highlight = function(group, color)
  vim.api.nvim_set_hl(0, group, color)
end

local set_groups = function()
  local groups = {
    Normal = {fg = #ffffff, bg = #ff0000}
  }

  for group, parameters in pairs(groups) do
    highlight(group, parameters)
  end
end

M.colorscheme = function()
  vim.api.nvim_command("Hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax restet")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "custom-theme"

  -- set_terminal_colors()
  set_groups()
end
return M

