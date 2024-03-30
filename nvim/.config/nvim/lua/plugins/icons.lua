return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override_by_filename = {
        ["toml"] = {
          icon = "",
          color = "#61afef",
          cterm_color = "74",
          name = "TOML",
        },
        [".env.development"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
        [".env"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
        [".env.production"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
        [".env.test"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
        [".env.local"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
        [".env.development.local"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
        [".env.production.local"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
        [".env.test.local"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
        [".env.staging"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
        [".env.staging.local"] = {
          icon = "",
          color = "#b2b2b2",
          name = "Env",
        },
      },

    });
  end,
  lazy = true
};
