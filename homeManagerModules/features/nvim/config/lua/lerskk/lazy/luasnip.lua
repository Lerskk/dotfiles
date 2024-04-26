return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',

  config = function()
    local ls = require("luasnip")

    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/luasnip/" })

    ls.setup {
      store_selection_keys = "<Tab>",
      enable_autosnippets = true,
    }
  end
}
