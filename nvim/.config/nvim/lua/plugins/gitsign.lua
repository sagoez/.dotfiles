return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      trouble = true,
      preview_config = {
        border = vim.lsp.borders,
      },
    })
  end
}
