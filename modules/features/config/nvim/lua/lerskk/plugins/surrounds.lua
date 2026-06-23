local autopairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')

autopairs.setup({
  enable_check_bracket_line = false
})

autopairs.add_rules({
  Rule("$", "$", "tex")
    :with_pair(function() return true end)
    :with_move(function(opts) return opts.next_char == "$" end),
  Rule("\\[", "\\]", "tex"):with_pair(function() return true end),
})

autopairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))

local surround = require("nvim-surround")

surround.setup({})
