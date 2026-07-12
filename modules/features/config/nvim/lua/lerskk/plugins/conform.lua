require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },
    jsonc = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    prisma = { "prisma-fmt", stop_after_first = true },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

local map = vim.keymap.set

map({ "n", "v" }, "<leader>fm", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format buffer" })
