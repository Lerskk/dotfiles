return {
  'nvimdev/dashboard-nvim',
  dependencies = {
    {'nvim-tree/nvim-web-devicons'}
  },
  event = 'VimEnter',

  config = function()
    require('dashboard').setup {
      theme = 'hyper', --  theme is doom and hyper default is hyper
      config = {},    --  config used for theme
      hide = {
        statusline,    -- hide statusline default is true
        tabline,       -- hide the tabline
        winbar,        -- hide winbar
      },
      preview = {
        command,       -- preview command
        file_path,     -- preview file path
        file_height,   -- preview file height
        file_width,    -- preview file width
      },
    }
  end
}
