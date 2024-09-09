return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      default = true,
      color_icons = false
    });
  end,
  lazy = true,
};
