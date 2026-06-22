return {
  "nvim-pack/nvim-spectre",
  build = false,
  lazy = true,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  keys = {
    { "<leader>fra", function() require("spectre").open() end,                                   desc = "Replace in files (Spectre)" },
    { "<leader>frr", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Replace in current word" },
  },
  config = function()
    require("spectre").setup({
      replace_engine = {
        ["sed"] = {
          cmd = "sed",
          args = {
            "-i",
            "",
            "-E",
          },
        },
      },
    })
  end
}
