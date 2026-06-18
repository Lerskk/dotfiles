local spider = require("spider")

spider.setup({
  skipInsignificantPunctuation = true,
  subwordMovement = true,
  consistentOperatorPending = false,
  customPatterns = {},
})

local map = vim.keymap.set

map({ "n", "o", "x" }, "w", function() spider.motion("w") end)
map({ "n", "o", "x" }, "e", function() spider.motion("e") end)
map({ "n", "o", "x" }, "b", function() spider.motion("b") end)
map({ "n", "o", "x" }, "ge", function() spider.motion("ge") end)
