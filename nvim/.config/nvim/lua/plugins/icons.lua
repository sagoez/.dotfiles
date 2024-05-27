return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      default = true,
      override = {
        gleam = {
          icon = "",
          color = "#ff75a0",
          cterm_color = "81",
          name = "Gleam",
        }
      }
    });
  end,
  lazy = true,
};
