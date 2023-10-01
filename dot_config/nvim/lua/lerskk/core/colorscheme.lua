local status, _ = pcall(vim.cmd, 'colorscheme minimal-dark')
if not status then
	print('Colorscheme not found')
	return
end
