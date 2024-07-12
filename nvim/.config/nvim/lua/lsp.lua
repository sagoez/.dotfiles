local api = vim.api
local map = vim.keymap.set

local setup = function()
  require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
  })
  local lsp_config = require("lspconfig")
  local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

  lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
    capabilities = cmp_capabilities,
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

  local lsp_group = api.nvim_create_augroup("lsp", { clear = true })

  local on_attach = function(_, bufnr)
    map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    map("n", "gtd", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
    map("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })
    map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
    map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
    map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Show signature help" })
    map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
    map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
    map("n", "<leader>cl", vim.lsp.codelens.run, { desc = "Run code lens" })
    map("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format" })

    api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
  end

  --================================
  -- Metals specific setup
  --================================
  local metals_config = require("metals").bare_config()
  metals_config.tvp = {
    icons = {
      enabled = true,
    },
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
    icons = "unicode"
  }

  metals_config.capabilities = cmp_capabilities

  metals_config.on_attach = function(client, bufnr)
    on_attach(client, bufnr)

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
      group = lsp_group,
    })
    api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = lsp_group,
    })
    -- api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
    --   callback = vim.lsp.codelens.refresh(),
    --   buffer = bufnr,
    --   group = lsp_group,
    -- })
    api.nvim_create_autocmd("FileType", {
      pattern = { "dap-repl" },
      callback = function()
        require("dap.ext.autocompl").attach()
      end,
      group = lsp_group,
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
        metals = {
          runType = "runOrTestFile",
        },
      },
      {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
          runType = "testTarget",
        },
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
      --vim.notify("Tests have finished!")
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

  --================================
  -- Rust specific setup
  --================================

  local rust_tools_opts = {
    tools = {
      hover_with_actions = false,
      reload_workspace_from_cargo_toml = true,
      inlay_hints = {
        only_current_line = false,
        show_parameter_hints = true,
        parameter_hints_prefix = " <- ",
        other_hints_prefix = "=> ",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },
    },
    server = {
      on_attach = on_attach,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    },
  }

  require("rust-tools").setup(rust_tools_opts)

  --================================
  -- Other LSP servers setup
  --================================

  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "grammar.js", "corpus/*.txt" },
    callback = function()
      vim.cmd("setfiletype tree-sitter-grammar")
    end,
  })

  vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "grammar.js" },
    command = "set syntax=javascript",
  })

  lsp_config.lua_ls.setup({
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = { globals = { "vim", "it", "describe", "before_each" } },
        telemetry = { enable = false },
      },
    },
  })

  lsp_config.yamlls.setup({
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      on_attach(client, bufnr)
    end,
    settings = {
      yaml = {
        format = {
          enable = true,
        },
        schemas = {
          ["https://raw.githubusercontent.com/docker/cli/master/cli/compose/schema/data/config_schema_v3.10.json"] =
          "*-compose.yaml",
        },
      },
    },
  })

  local client_capabilities = vim.lsp.protocol.make_client_capabilities()
  client_capabilities.textDocument.completion.completionItem.snippetSupport = true

  lsp_config.jsonls.setup({
    capabilities = client_capabilities,
    on_attach = on_attach,
  })

  lsp_config.html.setup({
    capabilities = client_capabilities,
    on_attach = on_attach,
  })

  require("typescript-tools").setup({
    on_attach = on_attach,
  })

  -- Remember to install the ElixirLS server
  -- curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/download/v0.22.0/elixir-ls-v0.22.0.zip or latest
  -- unzip elixir-ls-v0.22.0.zip -d /usr/local/bin/elixir-ls
  -- chmod +x /usr/local/bin/elixir-ls/language_server.sh
  require 'lspconfig'.elixirls.setup {
    -- Unix
    cmd = { "/usr/local/bin/elixir-ls/language_server.sh" },
  }

  -- These server just use the vanilla setup
  local servers = { "bashls", "dockerls", "gopls", "clangd", "sqls", "gleam" }
  for _, server in pairs(servers) do
    lsp_config[server].setup({ on_attach = on_attach })
  end
end

return {
  setup = setup,
}
