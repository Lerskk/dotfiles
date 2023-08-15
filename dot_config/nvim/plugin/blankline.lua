local status, blackline = pcall(require, 'indent_blankline')
if (not status) then return end

blackline.setup {
  show_current_context = true,
  show_current_context_start = true
}
