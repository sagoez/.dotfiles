return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup {
      indent = {
        highlight = "Whitespace",
        char = ".",
      },
      whitespace = {
        highlight = "Whitespace",
        remove_blankline_trail = true,
      },
      scope = {
        enabled = true,
      },
    }
  end
}
