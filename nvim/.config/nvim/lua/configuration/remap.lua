-- move selected highlighted with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- move line below as a continuation of the current line
vim.keymap.set("n", "J", "mzJ`z", { desc = "Move line below as a continuation of the current line" })

-- move cursor below faster
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move cursor below faster" })
-- move cursor above faster
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move cursor above faster" })
-- move cursor to the next pattern match at the "/ register
vim.keymap.set("n", "n", "nzzzv", { desc = "Move cursor to the next pattern match" })
-- move cursor to the previous pattern match at the "/ register
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move cursor to the previous pattern match" })

-- x means visual mode only
-- s means select mode only
-- v means select and visual mode
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over the selected text" })

-- remove trailing whitespaces
vim.keymap.set('n', '<leader>wt', [[:%s/\s\+$//e<cr>]], { desc = "Remove trailing whitespaces" })

-- copy to the system clipboard to use outside of neovim
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to the system clipboard" })
-- copy to the system clipboard to use outside of neovim (including the newline)
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to the system clipboard (including the newline)" })

-- delete the line without copying it
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete the line without copying it" })

-- if 'jq' is installed, format the current buffer with it
vim.keymap.set('n', '<leader>jq', "[[:%!jq '.'<CR>]]", { desc = "Format the current buffer with jq" })

-- disable 'Q' key
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable 'Q' key" })

-- navigate to the next quickfix item and place it in the middle of the screen
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Navigate to the next quickfix item" })
-- navigate to the previous quickfix item and place it in the middle of the screen
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Navigate to the previous quickfix item" })
-- navigate to the next location list item and place it in the middle of the screen
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Navigate to the next location list item" })
-- navigate to the previous location list item and place it in the middle of the screen
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Navigate to the previous location list item" })

-- replace the current word with the word under the cursor, will allow to modify
-- the word before replacing it
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace the current word with the word under the cursor" })

-- resource the current file
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Resource the current file" })

-- enable spell checking and set the language to English
vim.keymap.set("n", "<leader>ch", function()
  vim.cmd("setlocal spell! spelllang=en_us")
end, { desc = "Enable spell checking and set the language to English" })

-- open a floating window with the diagnostics of the current line
vim.keymap.set("n", "<leader>ee", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, { desc = "Open a floating window with the diagnostics of the current line" })

-- will take the selected text and search for replace in the current buffer
vim.keymap.set("v", "<C-r>", [["hy:%s/<C-r>h//gc<left><left><left>]])

-- open the quickfix list and place it in the middle of the screen
vim.keymap.set("n", "<leader>co", [[:vimgrep /\w\+/j % | copen<CR>]], { desc = "Open the quickfix list" })

-- navigate between buffers with <C-,> and <C-.>
vim.api.nvim_set_keymap('n', '<C-,>', '<Cmd>BufferPrevious<CR>',
  { noremap = true, silent = true, desc = "Navigate to the previous buffer" })
vim.api.nvim_set_keymap('n', '<C-.>', '<Cmd>BufferNext<CR>',
  { noremap = true, silent = true, desc = "Navigate to the next buffer" })
-- close the current buffer with <C-c>
vim.api.nvim_set_keymap('n', '<C-c>', '<Cmd>BufferClose<CR>',
  { noremap = true, silent = true, desc = "Close the current buffer" })
