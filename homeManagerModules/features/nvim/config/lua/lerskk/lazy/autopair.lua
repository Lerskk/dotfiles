return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local autopairs = require("nvim-autopairs")

        autopairs.setup({
            map_cr = false,        -- absolutely required for Blink
            map_complete = false,  -- Blink handles completion
            fast_wrap = {},
        })

        -- Blink integration
        local ok, blink = pcall(require, "blink.cmp")
        if ok then
            blink.confirm = blink.confirm or {}
            blink.confirm.on_confirm_done = function(item, bufnr)
                require("nvim-autopairs.completion.cmp").on_confirm_done()({
                    entry = { get_completion_item = function() return item end },
                    buffer = bufnr,
                })
            end
        end
    end
}
