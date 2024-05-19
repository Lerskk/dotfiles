local helpers = require('lerskk.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  s({
      trig = "ann",
      snippetType = "autosnippet",
      desc = "Annotate (custom command for annotating equation derivations)"
    },
    fmta(
      "\\annotate{<>}{<>}",
      {
        i(1),
        d(2, get_visual),
      }
    )
  ),

  s({
      trig = "reff",
      wordTrig = false,
      snippetType = "autosnippet",
      desc = "Reference"
    },
    fmta(
      "~\\ref{<>}",
      {
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "doc",
      snippetType = "autosnippet",
      desc = "Document class"
    },
    fmta(
      [=[
      \documentclass[<>]{<>}
      ]=],
      {
        i(1, "a4paper"),
        i(2, "article"),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "pack",
      snippetType = "autosnippet",
      desc = "Use a latex package"
    },
    fmta(
      "\\usepackage{<>}",
      {
        d(1, get_visual),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "inn",
      -- snippetType = "autosnippet",
      desc = "Input a LaTeX file"
    },
    fmta(
      "\\input{<><>}",
      {
        i(1, "~/.config/latex/templates/"),
        i(2),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "lbl",
      snippetType = "autosnippet",
      desc = "Label"
    },
    fmta(
      "\\label{<>}",
      {
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "hpp",
      snippetType = "autosnippet",
      desc = "Hphantom"
    },
    fmta(
      "\\hphantom{<>}",
      {
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "TODOO",
      snippetType = "autosnippet",
      desc = "Todo"
    },
    fmta(
      [[\Todo{<>}]],
      {
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "nc",
      snippetType = "autosnippet",
      desc = "New command"
    },
    fmta(
      [[\newcommand{<>}{<>}]],
      {
        i(1),
        i(2),
      }
    ),
    { condition = line_begin }
  ),

  s({
      trig = "sii",
      snippetType = "autosnippet",
      desc = "Si"
    },
    fmta(
      [[\si{<>}]],
      {
        i(1),
      }
    )
  ),

  s({
      trig = "qtt",
      snippetType = "autosnippet",
      desc = "Qtt"
    },
    fmta(
      [[\qty{<>}{<>}]],
      {
        i(1),
        i(2),
      }
    )
  ),

  s({
      trig = "url",
      snippetType = "autosnippet",
      desc = "URL"
    },
    fmta(
      [[\url{<>}]],
      {
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "LU",
      snippetType = "autosnippet",
      desc = "href command with URL in visual selection"
    },
    fmta(
      [[\href{<>}{<>}]],
      {
        d(1, get_visual),
        i(2),
      }
    )
  ),

  s({
      trig = "hss",
      snippetType = "autosnippet",
      desc = "Hspace"
    },
    fmta(
      [[\hspace{<>}]],
      {
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "h1",
      snippetType = "autosnippet",
      desc = "Section"
    },
    fmta(
      [[\section{<>}]],
      {
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "h2",
      snippetType = "autosnippet",
      desc = "Subsection"
    },
    fmta(
      [[\subsection{<>}]],
      {
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "h3",
      snippetType = "autosnippet",
      desc = "Section"
    },
    fmta(
      [[\subsubsection{<>}]],
      {
        d(1, get_visual),
      }
    )
  ),





}
