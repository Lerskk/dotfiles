local helpers = require("luasnip-helper")
local get_visual = helpers.get_visual

return {
  s({ trig = "env" },
    fmta([[
      \begin{<>}
        <>
      \end{<>}
    ]],
      {
        i(1),
        i(0),
        rep(1),
      })
  ),
  s({ trig = "(%s)mm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta([[
      <>$<>$
    ]],
      {
        f(function(_, parent) return parent.captures[1] end),
        d(1, get_visual),
      })
  ),
  s({ trig = "(%s)mb", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta([[
      <>$$<>$$
    ]],
      {
        f(function(_, parent) return parent.captures[1] end),
        d(1, get_visual),
      })
  ),
  s({ trig = "sec" },
    fmta([[
      \section{<>}
    ]],
      {
        d(1, get_visual),
      })
  ),
  s({ trig = "ssec" },
    fmta([[
      \subsection{<>}
    ]],
      {
        d(1, get_visual),
      })
  ),
  s({ trig = "sssec" },
    fmta([[
      \subsubsection{<>}
    ]],
      {
        d(1, get_visual),
      })
  ),
}
