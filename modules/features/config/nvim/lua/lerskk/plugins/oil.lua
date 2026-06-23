local oil = require("oil")

oil.setup({})

local map = vim.keymap.set

map("n", "\\", function() vim.cmd("Oil") end)
