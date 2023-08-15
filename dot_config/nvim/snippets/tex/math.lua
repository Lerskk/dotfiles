local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end
tex.in_comment = function() return vim.fn['vimtex#syntax#in_comment']() == 1 end

local is_empty = function(index, parent)
  if parent.captures[1] == "" then
    return sn(nil, i(1))
  end
  return sn(nil, t(parent.captures[1]))
end

return {
  s({trig = "sr", snippetType = "autosnippet"},
    fmta("^{2}<>",   
    {
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "cb", snippetType = "autosnippet"},
    fmta("^{3}<>",   
    {
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "inv", snippetType = "autosnippet"},
    fmta([[^{-1}<>]],   
    {
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "(%w*)po", wordTrig = false, regTrig = true, snippetType = "autosnippet"},
    fmta("<>^{<>}<>",   
    {
      f(function(_, parent) return parent.captures[1] end ),
      i(1),
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "(%w*)abs", wordTrig = false, regTrig = true, snippetType = "autosnippet"},
    fmta("|<>|<>",   
    {
      d(1, is_empty),
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "([%a%)%]%}])00", wordTrig = false, regTrig = true, snippetType = "autosnippet"},
    fmta("<>_{0}<>",   
    {
      f(function(_, parent) return parent.captures[1] end ),
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "([%a%)%]%}])__", wordTrig = false, regTrig = true, snippetType = "autosnippet"},
    fmta("<>_{<>}<>",   
    {
      f(function(_, parent) return parent.captures[1] end ),
      i(1),
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "(%w*)hat", wordTrig = false, regTrig = true, snippetType = "autosnippet"},
    fmta(" \\hat{<>}<>",   
    {
      d(1, is_empty),
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "(%w*)bar", wordTrig = false, regTrig = true, snippetType = "autosnippet"},
    fmta(" \\overline{<>}<>",   
    {
      d(1, is_empty),
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "(%w*)vec", wordTrig = false, regTrig = true, snippetType = "autosnippet"},
    fmta(" \\vec{<>}<>",   
    {
      d(1, is_empty),
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
  s({trig = "ff", wordTrig = false, regTrig = true, snippetType = "autosnippet"},
    fmta([[
      \frac{<>}{<>}<>
    ]],   
    {
      i(1),
      i(2),
      i(0),
    }),
    {condition = tex.in_mathzone}
  ),
}
