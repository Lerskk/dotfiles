return {
  {
    "saghen/blink.cmp",
    dependencies = { "L3MON4D3/LuaSnip" },

    version = "1.*",

    opts = {
      keymap = {
        preset = "default",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      },

      snippets = {
        preset = "luasnip",
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = { documentation = { auto_show = true, } },

      sources = {
        default = { "lsp", "snippets", "buffer", "path" },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
}
