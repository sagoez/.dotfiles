return {
  "catppuccin/nvim",
  priority = 1000,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",
    })

    vim.cmd.colorscheme("catppuccin-frappe")
  end
}
