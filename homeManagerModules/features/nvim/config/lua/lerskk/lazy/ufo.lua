return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter",
    "lervag/vimtex",
  },

  event = "BufReadPost",

  config = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require("ufo").setup({
      fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate)
        local new_virt_text = {}
        local suffix = ("  %d lines"):format(end_lnum - lnum) 
        local suf_width = vim.fn.strdisplaywidth(suffix)
        local target_width = width - suf_width

        local cur_width = 0
        for _, chunk in ipairs(virt_text) do
          local chunk_text = chunk[1]
          local chunk_width = vim.fn.strdisplaywidth(chunk_text)
          if target_width > cur_width + chunk_width then
            table.insert(new_virt_text, chunk)
            cur_width = cur_width + chunk_width
          else
              chunk_text = truncate(chunk_text, target_width - cur_width)
              table.insert(new_virt_text, { chunk_text, chunk[2] })
              cur_width = target_width
              break
          end
        end
        table.insert(new_virt_text, { suffix, "MoreMsg" })
        return new_virt_text
      end,
      provider_selector = function(bufnr, filetype, buftype)
        -- Adding back vimtex support for robustness
        if filetype == "tex" or filetype == "latex" then
          return { "vimtex", "treesitter", "indent" }
        end
        return { "treesitter", "indent" }
      end,
    })
  end,

  keys = {
    { "zR", function() require("ufo").openAllFolds() end,    desc = "UFO: Open All Folds" },
    { "zM", function() require("ufo").closeAllFolds() end,   desc = "UFO: Close All Folds" },
    
    { "zc", function() require("ufo").closeFold() end,      desc = "UFO: Close Fold" },
    { "zo", function() require("ufo").openFold() end,       desc = "UFO: Open Fold" },
    { "za", function() require("ufo").toggleFold() end,     desc = "UFO: Toggle Fold" },

    { "zr", function() require("ufo").openFoldsExceptKinds() end, desc = "UFO: Open Less Folds" },
    { "zm", function() require("ufo").closeFoldsWith() end, desc = "UFO: Close More Folds" },
  }
}
