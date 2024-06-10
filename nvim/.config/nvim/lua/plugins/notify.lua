return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      on_open = function()
      end,
      on_close = function()
      end,
      max_width = 80,
      max_height = 15,
      background_colour = "NotifyBackground",
      fps = 60,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      time_formats = {
        notification = "%T",
        notification_history = "%FT%T"
      },
      timeout = 3000,
      top_down = false,
    })
  end
}
