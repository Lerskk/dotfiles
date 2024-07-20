local helpers = require('lerskk.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  s({
      trig = "cite",
      desc = "parencite"
    },
    fmta(
      [[\parencite{<>}<>]],
      {
        d(1, get_visual),
        i(0),
      }
    )
  ),
}
