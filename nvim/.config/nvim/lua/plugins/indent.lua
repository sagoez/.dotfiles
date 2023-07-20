return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("indent_blankline").setup({
      char = "⋅",
      filetype_exclude = { "help" },
    })
  end
}
