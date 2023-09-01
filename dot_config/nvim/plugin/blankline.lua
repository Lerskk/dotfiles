local status, blackline = pcall(require, 'indent_blankline')
if (not status) then return end

blackline.setup {}
