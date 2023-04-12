vim.g.mapleader = " "

vim.o.background = nil
vim.o.cmdheight = 0
vim.o.showtabline = 2
vim.o.laststatus = 3
vim.opt_global.completeopt = { "menuone", "noinsert", "noselect" }
vim.g.copilot_assume_mapped = true

vim.g.copilot_filetypes = {
    ["*"] = true
}

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 300

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function(args)
        if vim.fn.isdirectory(args.match) == 1 then
            vim.cmd("NvimTreeToggle")
            return true
        end
    end,
})
