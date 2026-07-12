local opt = vim.opt

opt.termguicolors = true
vim.opt.cursorline = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.fileencoding = "utf-8"

opt.wrap = true
opt.breakindent = true
opt.showbreak = " "
opt.linebreak = true

opt.number = true
opt.relativenumber = true


opt.scrolloff = 4

opt.undofile = true

opt.spell = true

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true
opt.autoread = true
opt.signcolumn = "yes"

opt.inccommand = "split"

opt.pumheight = 15


opt.backup = false
opt.swapfile = false

opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2

opt.clipboard:append { "unnamedplus" }
opt.backspace = { "indent", "eol", "start" }
opt.path:append { "**" }
opt.wildignore:append { "*/node_modules/*" }

vim.opt_local.formatoptions:remove({ "c", "r", "o" })

vim.opt.conceallevel = 2

vim.filetype.add({
	extension = {
		["vert"] = "glsl",
		["tesc"] = "glsl",
		["tese"] = "glsl",
		["frag"] = "glsl",
		["geom"] = "glsl",
		["comp"] = "glsl",
		["vs"] = "glsl",
		["fs"] = "glsl",
		["prisma"] = "prisma",
	},
	filename = {
		["schema.prisma"] = "prisma",
	},
})


