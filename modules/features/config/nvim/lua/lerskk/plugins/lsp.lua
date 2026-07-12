vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("ltex_plus", {
  settings = {
    ltex = {
      language = "en-US",
    },
  },
})

vim.lsp.config("ts_ls", {
  settings = {
    typescript = {
      inlayHints = {
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
      },
    },
    javascript = {
      inlayHints = {
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
      },
    },
  },
})

vim.lsp.config("prisma", {
  settings = {
    prisma = {
      enableDiagnostics = true,
    },
  },
})

vim.lsp.enable("texlab")
vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("ltex_plus")
vim.lsp.enable("ts_ls")
vim.lsp.enable("prisma")

local map = vim.keymap.set

map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gi", vim.lsp.buf.implementation)

map("n", "K", vim.lsp.buf.hover)

map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)

map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

require("blink.cmp").setup({
  keymap = {
    preset = "default",

    ["<C-j>"] = { "select_next" },
    ["<C-k>"] = { "select_prev", "fallback" },
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    list = {
      max_items = 200,

      selection = {
        preselect = true,

        auto_insert = false,
      },
    },

    documentation = {
      auto_show = true,
    },
  },

  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
  },

  snippets = {
    preset = "luasnip",
  },

  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})


