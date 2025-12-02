local lsp_handlers = require("lerskk.lsp.handlers")

local common_config = {
  on_attach = lsp_handlers.on_attach,
  root_markers = { ".git", "Makefile" },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
}

vim.lsp.config("*", common_config)

vim.lsp.config("texlab", vim.tbl_deep_extend("force", common_config, {
    -- *** CRITICAL FIX FOR MANUAL SETUP ON NIXOS ***
    -- Provide the explicit executable path, which 'lspconfig' usually handles automatically.
    cmd = { "/etc/profiles/per-user/lerskk/bin/texlab" }, 

    settings = {
        texlab = {
            auxDirectory = ".texlab_aux",
            build = {
                onSave = true,
                executable = "pdflatex",
                args = { "-interaction=nonstopmode", "%f" },
                forwardSearchAfter = true,
            },
            forwardSearch = {
                executable = "zathura",
                args = {
                    "--synctex-forward",
                    "%l:%c:%f",
                    "%p"
                }
            },
        }
    }
}))

vim.lsp.enable("texlab")
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
