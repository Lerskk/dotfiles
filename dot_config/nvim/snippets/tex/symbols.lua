local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end

return {
  s({ trig = "=<", dscr = "Expands =< to \\impliesby", snippetType = "autosnippet" },
    fmta([[
      \impliesby
    ]], {}),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "al", dscr = "Expands al to \\aleph", snippetType = "autosnippet" },
    fmta([[
      \aleph
    ]], {}),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "##", dscr = "Expands ## to \\#", snippetType = "autosnippet" },
    fmta([[
      \#
    ]], {}),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "sum", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \sum_{n=<>}^{<>} <>
    ]],
      {
        i(1, "1"),
        i(2, "\\infty"),
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "not", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \not<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "sim", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \sim<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "sum", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta(
      [[
      \sum_{i=<>}^{<>} <>
    ]],
      {
        i(1, "1"),
        i(2, "\\infty"),
        i(0),
      }
    ),
    { condition = tex.in_mathzone }
  ),
  -- logic
  s({ trig = "and", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \land<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "or", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \lor<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "->", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \rightarrow<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "=>", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \implies<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "iff", dscr = "Expands sum to \\sum", snippetType = "autosnippet", priority = 1010 },
    fmta([[
      \iff<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  -- sets
  s({ trig = "nset", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \mathbb{<>}<>
    ]],
      {
        i(1),
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "ins", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \in<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "int", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \cap<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "uni", dscr = "Expands sum to \\sum", snippetType = "autosnippet" },
    fmta([[
      \cup<>
    ]],
      {
        i(0),
      }),
    { condition = tex.in_mathzone }
  ),
}
