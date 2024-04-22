return {
  "epwalsh/pomo.nvim",
  version = "*", -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat" },
  dependencies = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    "rcarriga/nvim-notify",
  },
  keys = {
    { "<leader>tb", ":TimerStart ",  desc = 'Start timer' },
    { "<leader>te", ":TimerStop ",   desc = 'Stop timer' },
    { "<leader>ts", ":TimerShow",    desc = 'Show timer' },
    { "<leader>th", ":TimerHide",    desc = 'Hide timer' },
    { "<leader>tp", ":TimerPause ",  desc = 'Pause timer' },
    { "<leader>tr", ":TimerResume ", desc = 'Resume timer' },
  },
  opts = {
    -- See below for full list of options 👇
  },
}
