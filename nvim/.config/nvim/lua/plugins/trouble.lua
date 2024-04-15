return {
  "folke/trouble.nvim",
  config = function()
    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
      { silent = true, noremap = true , desc = "Toggle Trouble" }
    )

    vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
      { silent = true, noremap = true , desc = "Toggle workspace diagnostics with Trouble" }
    )

    vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
      { silent = true, noremap = true , desc = "Toggle document diagnostics with Trouble" }
    )

    vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
      { silent = true, noremap = true , desc = "Toggle quickfix with Trouble" }
    )

    vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
      { silent = true, noremap = true , desc = "Toggle LSP references with Trouble" }
    )
  end
}
