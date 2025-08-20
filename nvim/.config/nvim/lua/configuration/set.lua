local g = vim.g
local o = vim.o
local opt = vim.opt
local global_opt = vim.opt_global
local indent = 2

g.netrw_gx = "<cWORD>"

-- o.background = ""

-- global
global_opt.shortmess:append("c")
global_opt.termguicolors = true
global_opt.hidden = true
global_opt.showtabline = 1
global_opt.updatetime = 300
global_opt.showmatch = true
global_opt.laststatus = 3
global_opt.wildignore = { ".git", "*/node_modules/*", "*/target/*", ".metals", ".bloop", ".ammonite" }
global_opt.ignorecase = true
global_opt.smartcase = true
global_opt.clipboard = "unnamed"
global_opt.completeopt = { "menuone", "noinsert", "noselect" }
global_opt.scrolloff = 5
global_opt.laststatus = 3
global_opt.mouse = ""
global_opt.cmdheight = 0

-- g.copilot_assume_mapped = true
-- g.copilot_filetypes = {
--   ["*"] = true
-- }

if g.light then
  global_opt.background = "light"
else
  global_opt.background = "dark"
end

opt.wrap = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

opt.tabstop = indent
opt.shiftwidth = indent
opt.softtabstop = indent
opt.expandtab = true
opt.fileformat = "unix"
opt.modeline = false

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.nu = true
opt.relativenumber = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.scrolloff = 16
opt.signcolumn = "yes"
opt.isfname:append("@-@")
