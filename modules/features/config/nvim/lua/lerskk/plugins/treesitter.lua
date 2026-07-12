local treesitter = require("nvim-treesitter")

treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

treesitter.install({
  "lua",
  "vim",
  "vimdoc",
  "query",
  "nix",
  "bash",
  "c",
  "cpp",
  "tsx",
  "typescript",
  "javascript",
  "json",
  "html",
  "css",
  "prisma",
})

require("nvim-ts-autotag").setup()

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if vim.bo[args.buf].filetype ~= "tex" then
      pcall(vim.treesitter.start)
    end

    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
})
