local treesitter = require("nvim-treesitter")

treesitter.setup()

treesitter.install({
	"lua",
	"vim",
	"vimdoc",
	"query",
	"nix",
	"bash",
	"c",
	"cpp",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start)

    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end })
