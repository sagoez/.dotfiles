return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup {
      options = {
        section_separators = '',
        component_separators = { left = '', right = '' },
      },
    }
  end
}
