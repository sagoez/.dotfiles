-- move selected highlighted with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- move line below as a continuation of the current line
vim.keymap.set("n", "J", "mzJ`z")

-- move cursor below faster
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- move cursor above faster
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- move cursor to the next pattern match setted but '/'
vim.keymap.set("n", "n", "nzzzv")
-- move cursor to the previous pattern match setted but '/'
vim.keymap.set("n", "N", "Nzzzv")

-- delete the current line and paste it above the current cursor position
vim.keymap.set("x", "<leader>p", [["_dP]])

-- remove trailing whitespaces
vim.keymap.set('n', '<leader>wt', [[:%s/\s\+$//e<cr>]])

-- copy to the system clipboard to use outside of neovim
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- copy to the system clipboard to use outside of neovim (including the newline)
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete the current line without copying it
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- if 'jq' is installed, format the current buffer with it
vim.keymap.set('n', '<leader>jq', "[[:%!jq '.'<CR>]]")

-- disable 'Q' key
vim.keymap.set("n", "Q", "<nop>")

-- navigate to the next quickfix item and place it in the middle of the screen
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- navigate to the previous quickfix item and place it in the middle of the screen
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- navigate to the next location list item and place it in the middle of the screen
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- navigate to the previous location list item and place it in the middle of the screen
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the current word with the word under the cursor, will allow to modify
-- the word before replacing it
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- resource the current file
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- enable spell checking and set the language to English
vim.keymap.set("n", "<leader>ch", function()
  vim.cmd("setlocal spell! spelllang=en_us")
end)

-- open a floating window with the diagnostics of the current line
vim.keymap.set("n", "<leader>ee", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end)

-- will take the selected text and search for replace in the current buffer
vim.keymap.set("v", "<C-r>", [["hy:%s/<C-r>h//gc<left><left><left>]])

-- open the quickfix list and place it in the middle of the screen
vim.keymap.set("n", "<leader>co", [[:vimgrep /\w\+/j % | copen<CR>]])

local opts = { noremap = true, silent = true }
-- navigate between buffers with <C-,> and <C-.>
vim.api.nvim_set_keymap('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-.>', '<Cmd>BufferNext<CR>', opts)
-- close the current buffer with <C-c>
vim.api.nvim_set_keymap('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)
