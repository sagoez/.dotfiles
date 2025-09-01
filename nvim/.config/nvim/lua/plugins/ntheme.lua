return {
  "catppuccin/nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
      float = {
        transparent = false, -- enable transparent floating windows
        solid = false,       -- use solid styling for floating windows, see |winborder|
      },
    })
  end
}
