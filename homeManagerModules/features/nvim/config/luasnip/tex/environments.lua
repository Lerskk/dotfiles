local helpers = require('lerskk.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  s({
      trig = "([^%a])mm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Inline math"
    },
    fmta(
      [[<>$<>$]],
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "env",
      desc = "Generic environment"
    },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      {
        i(1),
        d(2, get_visual),
        rep(1),
      }
    )
  ),

  s({
      trig = "new",
      snippetType = "autosnippet",
      desc = "Generic environment"
    },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      {
        i(1),
        d(2, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "n2",
      snippetType = "autosnippet",
      desc = "Generic environment with one extra argument"
    },
    fmta(
      [[
      \begin{<>}{<>}
        <>
      \end{<>}
      ]],
      {
        i(1),
        i(2),
        d(3, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "n3",
      snippetType = "autosnippet",
      desc = "Generic environment with two extra argument"
    },
    fmta(
      [[
      \begin{<>}{<>}{<>}
        <>
      \end{<>}
      ]],
      {
        i(1),
        i(2),
        i(3),
        d(4, get_visual),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "nt",
      snippetType = "autosnippet",
      desc = "Topi environment"
    },
    fmta(
      [[
      \begin{topic}{<>}{<>}
        <>
      \end{topic}
      ]],
      {
        i(1),
        i(2),
        d(3, get_visual),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "nn",
      snippetType = "autosnippet",
      desc = "Equation"
    },
    fmta(
      [[
      \begin{equation}
        <>
      \end{equation}
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "ss",
      snippetType = "autosnippet",
      desc = "Split equation"
    },
    fmta(
      [[
      \begin{equation*}
        \begin{split}
          <>
        \end{split}
      \end{equation*}
      ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "all",
      snippetType = "autosnippet",
      desc = "Align"
    },
    fmta(
      [[
      \begin{align*}
        <>
      \end{align*}
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "itt",
      snippetType = "autosnippet",
      desc = "Itemize"
    },
    fmta(
      [[
      \begin{itemize*}
        \item <>
      \end{itemize*}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "enn",
      snippetType = "autosnippet",
      desc = "Enumerate"
    },
    fmta(
      [[
      \begin{enumerate*}
        \item <>
      \end{enumerate*}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "([^%l])mm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Inline math"
    },
    fmta(
      "<>$<>$",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual)
      }
    )
  ),

  s({
      trig = "^mm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Inline math on new line"
    },
    fmta(
      "$<>$",
      {
        i(1),
      }
    )
  ),

  s({
      trig = "fig",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Figure"
    },
    fmta(
      [[
      \begin{figure[htb!]
        \centering
        \includegraphics[width=<>\linewidth]{<>}
        \caption{<>}
        \label{fig:<>}
      \end{figure}
      ]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
      }
    ),
    { condition = line_begin }
  ),


}
