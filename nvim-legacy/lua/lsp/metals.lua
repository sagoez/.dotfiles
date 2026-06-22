local api = vim.api
local map = vim.keymap.set
local lsp = require("lsp")

local metals_config = require("metals").bare_config()

metals_config.tvp = {
  icons = { enabled = true },
}

metals_config.settings = {
  defaultBspToBuildTool = true,
  enableSemanticHighlighting = false,
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  serverVersion = "latest.snapshot",
}

metals_config.init_options = {
  statusBarProvider = "off",
  icons = "unicode",
}

metals_config.capabilities = lsp.capabilities

metals_config.on_attach = function(client, bufnr)
  lsp.on_attach(client, bufnr)

  local group = api.nvim_create_augroup("metals", { clear = true })

  map("v", "KA", require("metals").type_of_range, { desc = "Type of range" })
  map("n", "<leader>ws", function()
    require("metals").hover_worksheet({ border = "single" })
  end, { desc = "Hover worksheet" })
  map("n", "<leader>tt", require("metals.tvp").toggle_tree_view, { desc = "Toggle tree view" })
  map("n", "<leader>tr", require("metals.tvp").reveal_in_tree, { desc = "Reveal in tree" })
  map("n", "<leader>mmc", require("metals").commands, { desc = "Metals commands" })
  map("n", "<leader>mts", function()
    require("metals").toggle_setting("showImplicitArguments")
  end, { desc = "Toggle show implicit arguments" })

  api.nvim_create_autocmd("CursorHold", {
    callback = vim.lsp.buf.document_highlight,
    buffer = bufnr,
    group = group,
  })
  api.nvim_create_autocmd("CursorMoved", {
    callback = vim.lsp.buf.clear_references,
    buffer = bufnr,
    group = group,
  })
  api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    callback = vim.lsp.codelens.refresh,
    buffer = bufnr,
    group = group,
  })
  api.nvim_create_autocmd("FileType", {
    pattern = { "dap-repl" },
    callback = function()
      require("dap.ext.autocompl").attach()
    end,
    group = group,
  })

  local dap = require("dap")

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run or test with input",
      metals = {
        runType = "runOrTestFile",
        args = function()
          local args_string = vim.fn.input("Arguments: ")
          return vim.split(args_string, " +")
        end,
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Run or Test",
      metals = { runType = "runOrTestFile" },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = { runType = "testTarget" },
    },
    {
      type = "scala",
      request = "launch",
      name = "Run minimal2 main",
      metals = {
        mainClass = "minimal2.Main",
        buildTarget = "minimal",
      },
    },
  }

  map("n", "<leader>dc", require("dap").continue, { desc = "Continue debugging" })
  map("n", "<leader>dr", require("dap").repl.toggle, { desc = "Toggle REPL" })
  map("n", "<leader>dK", require("dap.ui.widgets").hover, { desc = "Hover" })
  map("n", "<leader>dt", function()
    require("dap").toggle_breakpoint('x == 6')
  end, { desc = "Toggle breakpoint" })
  map("n", "<leader>dso", require("dap").step_over, { desc = "Step over" })
  map("n", "<leader>dsi", require("dap").step_into, { desc = "Step into" })
  map("n", "<leader>drl", require("dap").run_last, { desc = "Run last" })

  dap.listeners.after["event_terminated"]["nvim-metals"] = function(_, _)
    dap.repl.open()
  end

  require("metals").setup_dap()
end

local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
