local map = vim.keymap.set
local lsp = require("lsp")

require("typescript-tools").setup({
  on_attach = function(client, bufnr)
    lsp.on_attach(client, bufnr)

    map("n", "<leader>to", "<cmd>TSToolsOrganizeImports<cr>", { desc = "Organize Imports", buffer = bufnr })
    map("n", "<leader>ts", "<cmd>TSToolsSortImports<cr>", { desc = "Sort Imports", buffer = bufnr })
    map("n", "<leader>tu", "<cmd>TSToolsRemoveUnused<cr>", { desc = "Remove Unused", buffer = bufnr })
    map("n", "<leader>td", "<cmd>TSToolsGoToSourceDefinition<cr>", { desc = "Go to Source Definition", buffer = bufnr })
    map("n", "<leader>tr", "<cmd>TSToolsRenameFile<cr>", { desc = "Rename File", buffer = bufnr })
    map("n", "<leader>tf", "<cmd>TSToolsFileReferences<cr>", { desc = "File References", buffer = bufnr })
    map("n", "<leader>ti", "<cmd>TSToolsAddMissingImports<cr>", { desc = "Add Missing Imports", buffer = bufnr })
    map("n", "<leader>tF", "<cmd>TSToolsFixAll<cr>", { desc = "Fix All", buffer = bufnr })
  end,
  settings = {
    separate_diagnostic_server = true,
    publish_diagnostic_on = "insert_leave",
    expose_as_code_action = "all",
    tsserver_max_memory = "auto",
    complete_function_calls = true,
    include_completions_with_insert_text = true,
    code_lens = "implementations_only",
    disable_member_code_lens = true,
    jsx_close_tag = {
      enable = true,
      filetypes = { "javascriptreact", "typescriptreact" },
    },
    tsserver_file_preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
      includeCompletionsForModuleExports = true,
      includeCompletionsForImportStatements = true,
      includeCompletionsWithSnippetText = true,
      includeAutomaticOptionalChainCompletions = true,
      allowIncompleteCompletions = true,
      allowRenameOfImportPath = true,
      allowTextChangesInNewFiles = true,
      displayPartsForJSDoc = true,
      generateReturnInDocTemplate = true,
      includePackageJsonAutoImports = "auto",
      quotePreference = "auto",
      useLabelDetailsInCompletionEntries = true,
    },
    tsserver_format_options = {
      allowIncompleteCompletions = false,
      allowRenameOfImportPath = false,
      convertTabsToSpaces = true,
      indentSize = 2,
      insertSpaceAfterCommaDelimiter = true,
      insertSpaceAfterSemicolonInForStatements = true,
      insertSpaceBeforeAndAfterBinaryOperators = true,
      insertSpaceAfterConstructor = false,
      insertSpaceAfterKeywordsInControlFlowStatements = true,
      insertSpaceAfterFunctionKeywordForAnonymousFunctions = false,
      insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
      insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
      insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
      insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
      insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
      insertSpaceAfterTypeAssertion = false,
      insertSpaceBeforeFunctionParenthesis = false,
      placeOpenBraceOnNewLineForFunctions = false,
      placeOpenBraceOnNewLineForControlBlocks = false,
      insertSpaceBeforeTypeAnnotation = false,
      semicolons = "ignore",
    },
  },
})
