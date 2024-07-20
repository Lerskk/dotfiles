local helpers = require('lerskk.luasnip-helper-funcs')
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Return snippet tables
return {
  s({ trig = "([%w%)%]%}])'", wordTrig = false, regTrig = true, snippetType = "autosnippet", desc = "Superscript" },
    fmta(
      "<>^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({ trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet", desc = "Subscript" },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "sd",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Text subscript"
    },
    fmta(
      "_{\\mathrm{<>}}",
      {
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = '([%w%)%]%}])"([%w])',
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Superscript, places the first alphanumeric character after the trigger into a superscript"
    },
    fmta(
      "<>^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[2] end),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "([^%a])ee",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Euler's number superscript shortcut"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("0")
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "([%a%)%]%}])00",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Zero subscript shortcut"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("0")
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "([%a%)%]%}])11",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Minus one superscript"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("-1")
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "([%a%)%]%}])%+%+",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Plus superscript"
    },
    fmta(
      "<>^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("+")
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "([%a%)%]%}])CC",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Complement superscript"
    },
    fmta(
      "<>^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\Complement")
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "([%a%)%]%}])%*%*",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Conjugate (star) superscript"
    },
    fmta(
      "<>^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("*")
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "([$%a])ue",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Default unit vector with subscript, i.e. \\univector\\{}"
    },
    fmta(
      "<>\\univector_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "([^%a])uv",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Unit vector with hat, i.e. \\uvec{}"
    },
    fmta(
      "<>\\uvec_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s(
    {
      trig = "([^%a])mt",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc =
      "Matrix, i.e. \\vec"
    },
    fmta(
      "<>\\mat{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])ff",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Fraction"
    },
    fmta(
      "<>\\frac{<>}{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])gg",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Angle"
    },
    fmta(
      "<>\\ang{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])aa",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Absolute value"
    },
    fmta(
      "<>\\abs{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])sq",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Square root"
    },
    fmta(
      "<>\\sqrt{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])udd",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Underline"
    },
    fmta(
      "<>\\underline{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])conj",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Overline"
    },
    fmta(
      "<>\\overline{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])hat",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Hat"
    },
    fmta(
      "<>\\hat{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])tld",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Tilde"
    },
    fmta(
      "<>\\tilde{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])bnn",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Binomial symbol"
    },
    fmta(
      "<>\\binom{<>}{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  -- s({
  --     trig = "([^%a%\\])ll",
  --     wordTrig = false,
  --     regTrig = true,
  --     snippetType = "autosnippet",
  --     desc = "Logarithm with base subscript"
  --   },
  --   fmta(
  --     "<>\\log_{<>}",
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       i(1),
  --     }
  --   ),
  --   { condition = tex.in_mathzone }
  -- ),

  s({
      trig = "([^%a])dV",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Derivative with denominator only"
    },
    fmta(
      "<>\\dvOne{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])dvv",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Derivative with numerator and denominator"
    },
    fmta(
      "<>\\dv{<>}{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])pV",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Partial derivate with denominator only"
    },
    fmta(
      "<>\\pdvOne{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])pvv",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Partial derivative with numerator and denominator"
    },
    fmta(
      "<>\\pdv{<>}{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])ppv",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Partial derivative with numerator, denominator, and higher-order argument"
    },
    fmta(
      "<>\\pdvN{<>}{<>}{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2),
        i(3),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])sM",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Sum with lower limit"
    },
    fmta(
      "<>\\sum_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])smm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Sum with upper and lower limit"
    },
    fmta(
      "<>\\sum_{<>}^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])intt",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Integral with upper and lower limit"
    },
    fmta(
      "<>\\int_{<>}^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])intf",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Integral from positive to nevative infiinity"
    },
    fmta(
      "<>\\int_{\\infty}^{\\infty}",
      {
        f(function(_, snip) return snip.captures[1] end),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "([^%a])bb",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Boxed command"
    },
    fmta(
      "<>\\boxed{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),

  s({ trig = "df", snippetType = "autosnippet", priority = 2000 },
    {
      t("\\diff"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "in1", snippetType = "autosnippet" },
    {
      t("\\int"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "in2", snippetType = "autosnippet" },
    {
      t("\\iint"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "in3", snippetType = "autosnippet" },
    {
      t("\\iiint"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "oi1", snippetType = "autosnippet" },
    {
      t("\\oi1"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "oi2", snippetType = "autosnippet" },
    {
      t("\\oiint"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "gdd", snippetType = "autosnippet" },
    {
      t("\\grad "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "cll", snippetType = "autosnippet" },
    {
      t("\\curl "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "DI", snippetType = "autosnippet" },
    {
      t("\\div "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "laa", snippetType = "autosnippet" },
    {
      t("\\laplacian"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "||", snippetType = "autosnippet" },
    {
      t("\\parallel"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "cdd", snippetType = "autosnippet" },
    {
      t("\\cdots"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "ldd", snippetType = "autosnippet" },
    {
      t("\\ldots"),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "eqq", snippetType = "autosnippet" },
    {
      t("\\equiv "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "stm", snippetType = "autosnippet" },
    {
      t("\\setminus "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "sbb", snippetType = "autosnippet" },
    {
      t("\\subset "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "px", snippetType = "autosnippet" },
    {
      t("\\approx "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "pt", snippetType = "autosnippet" },
    {
      t("\\propto "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = ",.", snippetType = "autosnippet" },
    {
      t("\\cdot "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "xx", snippetType = "autosnippet" },
    {
      t("\\times "),
    },
    { condition = tex.in_mathzone }
  ),

  s({ trig = "([^%a])!=", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\neq "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])<=", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\leq "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])>=", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\geq "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])<<", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\ll "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])>>", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\gg "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])~~", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\sim "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])~=", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\approx "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  -- s({ trig = "([^%a])~-", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     [[<><>]],
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       t("\\simeq "),
  --     },
  --     { condition = tex.in_mathzone }
  --   )
  -- ),

  s({ trig = "([^%a])-~", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\backsimeq "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  -- s({ trig = "([^%a])-=", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     [[<><>]],
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       t("\\equiv "),
  --     },
  --     { condition = tex.in_mathzone }
  --   )
  -- ),
  --
  -- s({ trig = "([^%a])=~", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     [[<><>]],
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       t("\\cong "),
  --     },
  --     { condition = tex.in_mathzone }
  --   )
  -- ),
  --
  s({ trig = "([^%a]):=", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\triangleq "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s(
    { trig = "([^%a])%*%*", wordTrig = false, regTrig = true, snippetType = "autosnippet", wordTrig = false, regTrig = true, priority = 100 },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\cdot "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])!%+", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\oplus "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])!%*", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\otimes "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])NN", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\mathbb{N}"),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])RR", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\mathbb{R}"),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])II", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\mathbb{I}"),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])ZZ", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\mathbb{Z}"),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])QQ", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\mathbb{Q} "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])CC", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\mathbb{C} "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])OO", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\emptyset "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])pwr", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\powerset "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])cc", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\subset "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])cq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\subseteq "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])qq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\subset "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])qc", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\subseteq "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])Nn", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\cap "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])Uu", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\cup "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])::", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\colon "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])AA", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\forall "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])EE", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\exists "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])inn", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\inn "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])notin", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\not \\in "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])%!%-", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\lnot "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  -- s({ trig = "([^%a])&&", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
  --   fmta(
  --     [[<><>]],
  --     {
  --       f(function(_, snip) return snip.captures[1] end),
  --       t("\\land "),
  --     },
  --     { condition = tex.in_mathzone }
  --   )
  -- ),

  s({ trig = "([^%a])||", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\lor "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])!|", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\bigwedge "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])=>", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\implies "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])impliedby", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\<= "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])iff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\iff "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])!>", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\mapsto "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])<%-", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\gets "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])dp", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\partial "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])%-%->", wordTrig = false, regTrig = true, snippetType = "autosnippet", priority = 2000 },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\longrightarrow "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])<%->", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\leftrightarrow "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])2>", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\rightarrows "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])upar", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\uparrow "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])dnar", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\downarrow "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])oo", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\infty "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])ll", wordTrig = false, regTrig = true },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\ell "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])dag", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\dagger "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])%+%-", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\pm "),
      },
      { condition = tex.in_mathzone }
    )
  ),

  s({ trig = "([^%a])%-%+", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[<><>]],
      {
        f(function(_, snip) return snip.captures[1] end),
        t("\\mp "),
      },
      { condition = tex.in_mathzone }
    )
  ),




}
