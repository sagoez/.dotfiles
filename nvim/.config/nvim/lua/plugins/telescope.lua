return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },
  config = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>fs', function()
      -- builtin.grep_string({ search = vim.fn.input("Grep > ") });
      require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") });
    end)
    vim.keymap.set("n", "<leader>ff", function()
      require("telescope.builtin").find_files({ layout_strategy = "vertical" })
    end)

    vim.keymap.set("n", "<leader>fd", function()
      require("telescope.builtin").find_files({ cwd = "~/.config/nvim", layout_strategy = "vertical" })
    end)

    vim.keymap.set("n", "<leader>lg", function()
      require("telescope.builtin").live_grep({ layout_strategy = "vertical" })
    end)

    vim.keymap.set("n", "<leader>gh", function()
      require("telescope.builtin").git_commits({ layout_strategy = "vertical" })
    end)

    vim.keymap.set("n", "<leader>mc", require("telescope").extensions.metals.commands)

    -- vim.keymap.set("n", "<leader>cc", require("telescope").extensions.coursier.complete)

    vim.keymap.set("n", "gds", require("telescope.builtin").lsp_document_symbols)

    vim.keymap.set("n", "gws", require("telescope.builtin").lsp_dynamic_workspace_symbols)

    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "target", "node_modules", "parser.c", "%.min.js" },
        prompt_prefix = "❯",
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        mappings = {
          n = {
            ["f"] = actions.send_to_qflist,
          },
        },
      },
    })

    require("telescope").load_extension("fzy_native")
  end
}
