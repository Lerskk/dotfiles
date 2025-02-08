local opt = vim.opt

-- better colors
opt.termguicolors = true
vim.opt.cursorline = true
-- number of space in a <Tab>
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.fileencoding = "utf-8"

-- Text
-- opt.textwidth = 80
opt.wrap = true -- line wrap
opt.breakindent = true -- keep indentation when wrapped
opt.showbreak = '↳' -- character to show at the start of a line that has been wrapped
opt.linebreak = true


-- enable autoindent
opt.autoindent = true

-- number of space used for autoindent
opt.shiftwidth = 2

-- add line numbers
opt.number = true
opt.relativenumber = true

-- highlights the matches text pattern when searching
opt.incsearch = true
-- opt.nohlsearch = true

-- open splits intuitively
opt.splitbelow = true
opt.splitright = true

-- start scrolling when 4 lines from top or bottom
opt.scrolloff = 4

-- save undo history
opt.undofile = true

-- word spelling
opt.spell = true

-- case insensitive search unless capital letters are used
opt.ignorecase = true
opt.smartcase = true

-- limit the amount of option on menu
opt.pumheight = 10

-- opt.showtabline = 2
-- opt.title = true
opt.smartindent = true
opt.backup = false
opt.swapfile = false -- no swap file
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.inccommand = 'split'
opt.smarttab = true
opt.showmatch = true
opt.autoread = true
opt.signcolumn = 'number'
opt.showbreak = '↳'

opt.clipboard:append { 'unnamedplus' }
opt.backspace = { 'indent', 'eol', 'start' }
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- Under curl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- disable comment on new line
vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })

vim.opt.conceallevel = 2

-- Automatically save and load folds
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*.*",
  command = "mkview",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.*",
  command = "silent! loadview",
})
