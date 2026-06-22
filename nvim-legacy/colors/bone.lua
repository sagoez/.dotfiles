-- Bone — light, warm colorscheme matching ghostty/kitty/cmux "Bone".
-- Palette ported from ghostty themes/Bone.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.o.termguicolors = true
vim.g.colors_name = "bone"

local c = {
  -- backgrounds (bg0 = base, getting darker)
  bg0  = "#f4efe5",
  bg1  = "#ece6d9",
  bg2  = "#e4ddcc",
  bg3  = "#d8d0bf",
  bg4  = "#cabfa9",
  -- foregrounds
  fg0  = "#2a2520",
  fg1  = "#3a3530",
  -- grays
  gray   = "#7d7468",
  gray_d = "#a89d8a",
  gray_dd = "#b8ad9a",
  -- accents (darker palette variants for contrast on light bg)
  red     = "#9a3838",
  green   = "#556a32",
  yellow  = "#a07030",
  blue    = "#3d5a75",
  magenta = "#754a6a",
  cyan    = "#4a7575",
  orange  = "#a86028",
  -- softer accent variants
  red_s     = "#b04545",
  green_s   = "#6a7d3e",
  yellow_s  = "#c08a3e",
  blue_s    = "#4a6b8a",
  magenta_s = "#8a5a7d",
  cyan_s    = "#5a8a8a",
  none = "NONE",
}

local function hi(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local groups = {
  -- Editor UI
  Normal       = { fg = c.fg0, bg = c.bg0 },
  NormalNC     = { fg = c.fg0, bg = c.bg0 },
  NormalFloat  = { fg = c.fg0, bg = c.bg1 },
  FloatBorder  = { fg = c.gray_d, bg = c.bg1 },
  FloatTitle   = { fg = c.fg1, bg = c.bg1, bold = true },
  Cursor       = { fg = c.bg0, bg = c.fg0 },
  lCursor      = { fg = c.bg0, bg = c.fg0 },
  CursorLine   = { bg = c.bg1 },
  CursorColumn = { bg = c.bg1 },
  CursorLineNr = { fg = c.orange, bold = true },
  LineNr       = { fg = c.gray_dd },
  SignColumn   = { bg = c.bg0 },
  ColorColumn  = { bg = c.bg1 },
  Visual       = { bg = c.bg3 },
  VisualNOS    = { bg = c.bg3 },
  Search       = { fg = c.fg0, bg = c.yellow_s },
  IncSearch    = { fg = c.bg0, bg = c.orange },
  CurSearch    = { fg = c.bg0, bg = c.orange },
  MatchParen   = { fg = c.red, bold = true, underline = true },
  Pmenu        = { fg = c.fg0, bg = c.bg2 },
  PmenuSel     = { fg = c.bg0, bg = c.blue },
  PmenuSbar    = { bg = c.bg3 },
  PmenuThumb   = { bg = c.bg4 },
  WildMenu     = { fg = c.bg0, bg = c.blue },
  StatusLine   = { fg = c.fg0, bg = c.bg3 },
  StatusLineNC = { fg = c.gray, bg = c.bg1 },
  TabLine      = { fg = c.gray, bg = c.bg1 },
  TabLineSel   = { fg = c.fg0, bg = c.bg0, bold = true },
  TabLineFill  = { bg = c.bg1 },
  WinSeparator = { fg = c.bg3 },
  VertSplit    = { fg = c.bg3 },
  Folded       = { fg = c.gray, bg = c.bg2 },
  FoldColumn   = { fg = c.gray_d, bg = c.bg0 },
  NonText      = { fg = c.gray_dd },
  Whitespace   = { fg = c.bg4 },
  SpecialKey   = { fg = c.gray_d },
  EndOfBuffer  = { fg = c.bg0 },
  Conceal      = { fg = c.gray },
  Directory    = { fg = c.blue, bold = true },
  Title        = { fg = c.green, bold = true },
  ErrorMsg     = { fg = c.red, bold = true },
  WarningMsg   = { fg = c.yellow },
  MoreMsg      = { fg = c.green },
  ModeMsg      = { fg = c.fg0, bold = true },
  Question     = { fg = c.blue },
  QuickFixLine = { bg = c.bg2 },
  Substitute   = { fg = c.bg0, bg = c.red },

  -- Syntax
  Comment        = { fg = c.gray, italic = true },
  Constant       = { fg = c.magenta },
  String         = { fg = c.green },
  Character      = { fg = c.green },
  Number         = { fg = c.magenta },
  Boolean        = { fg = c.magenta },
  Float          = { fg = c.magenta },
  Identifier     = { fg = c.fg0 },
  Function       = { fg = c.blue },
  Statement      = { fg = c.red },
  Conditional    = { fg = c.red },
  Repeat         = { fg = c.red },
  Label          = { fg = c.red },
  Operator       = { fg = c.fg1 },
  Keyword        = { fg = c.red },
  Exception      = { fg = c.red },
  PreProc        = { fg = c.cyan },
  Include        = { fg = c.cyan },
  Define         = { fg = c.cyan },
  Macro          = { fg = c.cyan },
  PreCondit      = { fg = c.cyan },
  Type           = { fg = c.yellow },
  StorageClass   = { fg = c.yellow },
  Structure      = { fg = c.yellow },
  Typedef        = { fg = c.yellow },
  Special        = { fg = c.orange },
  SpecialChar    = { fg = c.orange },
  Tag            = { fg = c.green },
  Delimiter      = { fg = c.fg1 },
  SpecialComment = { fg = c.gray, italic = true },
  Debug          = { fg = c.red },
  Underlined     = { fg = c.blue, underline = true },
  Ignore         = { fg = c.gray_d },
  Error          = { fg = c.red, bold = true },
  Todo           = { fg = c.bg0, bg = c.yellow, bold = true },

  -- Diagnostics
  DiagnosticError = { fg = c.red },
  DiagnosticWarn  = { fg = c.yellow },
  DiagnosticInfo  = { fg = c.blue },
  DiagnosticHint  = { fg = c.cyan },
  DiagnosticOk    = { fg = c.green },
  DiagnosticUnderlineError = { undercurl = true, sp = c.red },
  DiagnosticUnderlineWarn  = { undercurl = true, sp = c.yellow },
  DiagnosticUnderlineInfo  = { undercurl = true, sp = c.blue },
  DiagnosticUnderlineHint  = { undercurl = true, sp = c.cyan },
  DiagnosticVirtualTextError = { fg = c.red, bg = c.bg1 },
  DiagnosticVirtualTextWarn  = { fg = c.yellow, bg = c.bg1 },
  DiagnosticVirtualTextInfo  = { fg = c.blue, bg = c.bg1 },
  DiagnosticVirtualTextHint  = { fg = c.cyan, bg = c.bg1 },

  -- Diff / Git
  DiffAdd     = { bg = "#dde6cc" },
  DiffChange  = { bg = "#e3ddc9" },
  DiffDelete  = { fg = c.red, bg = "#ecd6d0" },
  DiffText    = { bg = "#cdd9b8" },
  diffAdded   = { fg = c.green },
  diffRemoved = { fg = c.red },
  diffChanged = { fg = c.yellow },
  GitSignsAdd    = { fg = c.green },
  GitSignsChange = { fg = c.yellow },
  GitSignsDelete = { fg = c.red },

  -- Spell
  SpellBad   = { undercurl = true, sp = c.red },
  SpellCap   = { undercurl = true, sp = c.blue },
  SpellRare  = { undercurl = true, sp = c.magenta },
  SpellLocal = { undercurl = true, sp = c.cyan },

  -- Treesitter
  ["@comment"]            = { link = "Comment" },
  ["@punctuation"]        = { fg = c.fg1 },
  ["@punctuation.bracket"] = { fg = c.fg1 },
  ["@punctuation.delimiter"] = { fg = c.fg1 },
  ["@constant"]           = { link = "Constant" },
  ["@constant.builtin"]   = { fg = c.magenta },
  ["@string"]             = { link = "String" },
  ["@string.escape"]      = { fg = c.orange },
  ["@character"]          = { link = "Character" },
  ["@number"]             = { link = "Number" },
  ["@boolean"]            = { link = "Boolean" },
  ["@float"]              = { link = "Float" },
  ["@function"]           = { link = "Function" },
  ["@function.builtin"]   = { fg = c.blue },
  ["@function.call"]      = { fg = c.blue },
  ["@function.macro"]     = { fg = c.cyan },
  ["@method"]             = { fg = c.blue },
  ["@method.call"]        = { fg = c.blue },
  ["@constructor"]        = { fg = c.yellow },
  ["@parameter"]          = { fg = c.fg0 },
  ["@keyword"]            = { link = "Keyword" },
  ["@keyword.function"]   = { fg = c.red },
  ["@keyword.return"]     = { fg = c.red },
  ["@keyword.operator"]   = { fg = c.red },
  ["@conditional"]        = { link = "Conditional" },
  ["@repeat"]             = { link = "Repeat" },
  ["@exception"]          = { link = "Exception" },
  ["@operator"]           = { link = "Operator" },
  ["@type"]               = { link = "Type" },
  ["@type.builtin"]       = { fg = c.yellow },
  ["@type.definition"]    = { fg = c.yellow },
  ["@namespace"]          = { fg = c.cyan },
  ["@module"]             = { fg = c.cyan },
  ["@field"]              = { fg = c.fg0 },
  ["@property"]           = { fg = c.fg0 },
  ["@variable"]           = { fg = c.fg0 },
  ["@variable.builtin"]   = { fg = c.red },
  ["@variable.parameter"] = { fg = c.fg0 },
  ["@variable.member"]    = { fg = c.fg0 },
  ["@label"]              = { fg = c.red },
  ["@tag"]                = { fg = c.red },
  ["@tag.attribute"]      = { fg = c.yellow },
  ["@tag.delimiter"]      = { fg = c.fg1 },
  ["@text"]               = { fg = c.fg0 },
  ["@text.title"]         = { fg = c.green, bold = true },
  ["@text.literal"]       = { fg = c.green },
  ["@text.uri"]           = { fg = c.blue, underline = true },
  ["@text.emphasis"]      = { italic = true },
  ["@text.strong"]        = { bold = true },

  -- LSP semantic tokens
  ["@lsp.type.class"]     = { fg = c.yellow },
  ["@lsp.type.enum"]      = { fg = c.yellow },
  ["@lsp.type.interface"] = { fg = c.yellow },
  ["@lsp.type.struct"]    = { fg = c.yellow },
  ["@lsp.type.namespace"] = { fg = c.cyan },
  ["@lsp.type.function"]  = { fg = c.blue },
  ["@lsp.type.method"]    = { fg = c.blue },
  ["@lsp.type.property"]  = { fg = c.fg0 },
  ["@lsp.type.variable"]  = { fg = c.fg0 },
  ["@lsp.type.parameter"] = { fg = c.fg0 },
  ["@lsp.type.keyword"]   = { fg = c.red },
  LspReferenceText  = { bg = c.bg2 },
  LspReferenceRead  = { bg = c.bg2 },
  LspReferenceWrite = { bg = c.bg2, bold = true },
  LspSignatureActiveParameter = { fg = c.orange, bold = true },
  LspInlayHint = { fg = c.gray_d, bg = c.bg1, italic = true },

  -- Telescope
  TelescopeNormal       = { fg = c.fg0, bg = c.bg1 },
  TelescopeBorder       = { fg = c.gray_d, bg = c.bg1 },
  TelescopePromptNormal = { fg = c.fg0, bg = c.bg2 },
  TelescopePromptBorder = { fg = c.gray_d, bg = c.bg2 },
  TelescopePromptTitle  = { fg = c.bg0, bg = c.orange, bold = true },
  TelescopeResultsTitle = { fg = c.bg1, bg = c.bg1 },
  TelescopePreviewTitle = { fg = c.bg0, bg = c.green, bold = true },
  TelescopeSelection    = { fg = c.fg0, bg = c.bg3, bold = true },
  TelescopeMatching     = { fg = c.orange, bold = true },

  -- nvim-cmp
  CmpItemAbbr          = { fg = c.fg0 },
  CmpItemAbbrDeprecated = { fg = c.gray, strikethrough = true },
  CmpItemAbbrMatch     = { fg = c.orange, bold = true },
  CmpItemAbbrMatchFuzzy = { fg = c.orange, bold = true },
  CmpItemKind          = { fg = c.magenta },
  CmpItemMenu          = { fg = c.gray },

  -- gitsigns/diff already above; barbar
  BufferCurrent       = { fg = c.fg0, bg = c.bg0, bold = true },
  BufferCurrentMod    = { fg = c.orange, bg = c.bg0, bold = true },
  BufferCurrentSign   = { fg = c.orange, bg = c.bg0 },
  BufferVisible       = { fg = c.fg1, bg = c.bg1 },
  BufferInactive      = { fg = c.gray, bg = c.bg1 },
  BufferInactiveMod   = { fg = c.yellow, bg = c.bg1 },

  -- which-key
  WhichKey          = { fg = c.blue },
  WhichKeyGroup     = { fg = c.yellow },
  WhichKeyDesc      = { fg = c.fg0 },
  WhichKeySeparator = { fg = c.gray },
  WhichKeyFloat     = { bg = c.bg1 },

  -- indent-blankline
  IblIndent = { fg = c.bg3 },
  IblScope  = { fg = c.gray_d },

  -- notify / noice
  NotifyBackground = { bg = c.bg1 },

  -- todo-comments fallbacks
  TodoBgTODO = { fg = c.bg0, bg = c.blue, bold = true },
  TodoBgFIXME = { fg = c.bg0, bg = c.red, bold = true },
}

for group, spec in pairs(groups) do
  hi(group, spec)
end

-- Terminal colors
vim.g.terminal_color_0  = "#3a3530"
vim.g.terminal_color_1  = "#b04545"
vim.g.terminal_color_2  = "#6a7d3e"
vim.g.terminal_color_3  = "#c08a3e"
vim.g.terminal_color_4  = "#4a6b8a"
vim.g.terminal_color_5  = "#8a5a7d"
vim.g.terminal_color_6  = "#5a8a8a"
vim.g.terminal_color_7  = "#3a3530"
vim.g.terminal_color_8  = "#7d7468"
vim.g.terminal_color_9  = "#9a3838"
vim.g.terminal_color_10 = "#556a32"
vim.g.terminal_color_11 = "#a07030"
vim.g.terminal_color_12 = "#3d5a75"
vim.g.terminal_color_13 = "#754a6a"
vim.g.terminal_color_14 = "#4a7575"
vim.g.terminal_color_15 = "#2a2520"
