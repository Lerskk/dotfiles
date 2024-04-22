local ls = require('luasnip')
ls.filetype_extend('typescriptreact', { 'typescript' })

return {
  s(
    { -- Table 1: snippet parameters
      trig = 'state',
      regTrig = false,
      priority = 100,
    },
    fmta(
      'const [<>, set<>] = useState(<>);<>',
      {
        i(1),
        f(function(args)
          return args[1][1]:gsub("^%l", string.upper)
        end, { 1 }),
        i(2),
        i(0),
      }
    )
  ),
  s(
    { trig = 'effect' },
    fmta(
      [[
      useEffect((<>) =>> {
        <>
      }, [<>]);<>
    ]],
      {
        i(1),
        i(2),
        i(3),
        i(0),
      }
    )
  ),
  s(
    { trig = 'ref' },
    fmta(
      [[const <> = useRef<<<>>>(<>);<>]],
      {
        i(1),
        i(2),
        i(3),
        i(0),
      }
    )
  ),
}
