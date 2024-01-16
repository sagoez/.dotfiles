vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected highlighted with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set('n', '<leader>wt', [[:%s/\s\+$//e<cr>]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set('n', '<leader>jq', "[[:%!jq '.'<CR>]]")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

vim.keymap.set("n", "<leader>ch", function()
  vim.cmd("setlocal spell! spelllang=en_us")
end)

vim.keymap.set("n", "<leader>ee", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end)

vim.keymap.set("v", "<C-r>", [["hy:%s/<C-r>h//gc<left><left><left>]])

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)
