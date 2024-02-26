return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<C-left>",  "<cmd>TmuxNavigateLeft<cr>" },
    { "<C-down>",  "<cmd>TmuxNavigateDown<cr>" },
    { "<C-up>",    "<cmd>TmuxNavigateUp<cr>" },
    { "<C-right>", "<cmd>TmuxNavigateRight<cr>" },
    { "<C-\\>",    "<cmd>TmuxNavigatePrevious<cr>" },
  },
}
