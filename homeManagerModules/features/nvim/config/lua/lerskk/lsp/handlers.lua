local keymap = vim.keymap
local diagnostic = vim.diagnostic
local telescope = require("telescope.builtin")

local M = {}

M.on_attach = function(client, bufnr)

    local opts = { buffer = bufnr, silent = true }

    
    opts.desc = "Show LSP references"
    keymap.set("n", "gr", telescope.lsp_references, opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Show LSP implementation"
    keymap.set("n", "gi", telescope.lsp_implementations, opts) -- Corrected Telescope call

    opts.desc = "Show LSP type definition"
    keymap.set("n", "gt", telescope.lsp_type_definitions, opts) -- Corrected Telescope call

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", telescope.diagnostics, opts) -- Corrected Telescope call

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", function()
      diagnostic.jump({ count = -1, float = true })
    end, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", function()
      diagnostic.jump({ count = 1, float = true })
    end, opts)

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

return M
