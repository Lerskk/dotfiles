local helpers = require('lerskk.luasnip-helper-funcs')
local get_visual = helpers.get_visual

function line_begin_or_not_letter(line_to_cursor, matched_trigger)
  local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
  local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match("[$%a]")
  return line_begin or non_letter
end

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

local line_begin = function(line_to_cursor, matched_trigger)
  return line_to_cursor:sub(1, -(#matched_trigger + 1)):match("^%s*$")
end

return {
  s({
      trig = "([^%a])tt",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      priority = 2000,
      desc = "Typewriter i.e. \\texttt"
    },
    fmta(
      "<>\\texttt{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_text }
  ),

  s({
      trig = "([^%a])tii",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      priority = 2000,
      desc = "Italic i.e. \\textit"
    },
    fmta(
      "<>\\textit{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "([^%a])tbb",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      priority = 2000,
      desc = "Bold i.e. \\textbf"
    },
    fmta(
      "<>\\textbf{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "([^%a])rmm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      priority = 2000,
      desc = "Math roman i.e. \\mathrm"
    },
    fmta(
      "<>\\mathrm{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "([^%a])mcc",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      priority = 2000,
      desc = "Math caligraphy i.e. \\mathcal"
    },
    fmta(
      "<>\\mathcal{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "([^%a])mbf",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      priority = 2000,
      desc = "Math boldface i.e. \\mathbf"
    },
    fmta(
      "<>\\mathbf{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "([^%a])mbb",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      priority = 2000,
      desc = "Math blackboard i.e. \\mathbb"
    },
    fmta(
      "<>\\mathbb{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({
      trig = "([^%a])tee",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      priority = 2000,
      desc = "Regular text i.e. \\text"
    },
    fmta(
      "<>\\text{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex.in_mathzone }
  ),
}
