-- Personal keymap overrides, carried over from my previous nvim config.
--
-- These live on each plugin's `keys` / `opts` field (NOT in config/keymaps.lua)
-- so lazy.nvim MERGES them with the LazyVim defaults instead of racing them.
-- To disable a default in any of these specs, add e.g. `{ "<leader>sg", false }`.

return {
  -- Search: snacks picker -------------------------------------------------
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>lg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      -- Disable the standalone <leader>n (Notification History) so <leader>n
      -- becomes a pure prefix and <leader>nt / <leader>nf work without delay.
      { "<leader>n", false },
      -- Notification History moved onto the freed-up <leader>n prefix.
      { "<leader>nh", function() Snacks.picker.notifications() end, desc = "Notification History" },
    },
  },

  -- Folder list on the left: neo-tree ------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer (left)" },
      { "<leader>nf", "<cmd>Neotree reveal<cr>", desc = "Reveal current file in explorer" },
    },
  },

  -- Tabs (buffers): bufferline -------------------------------------------
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<C-,>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer (tab)" },
      { "<C-.>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer (tab)" },
      -- NOTE: <C-c> overrides the normal-mode interrupt; <Esc> remains the fallback.
      { "<C-c>", function() Snacks.bufdelete() end, desc = "Close buffer (tab)" },
    },
  },

  -- LSP muscle memory: buffer-local, capability-gated --------------------
  -- gd / gr / K / <leader>ca already match LazyVim defaults, so only the
  -- keys that DIFFER from defaults are added here.
  -- The trailing comments show DUPLICATE bindings that already do the same
  -- thing (Neovim 0.11+ built-ins on the gr* prefix, and LazyVim defaults).
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },          -- dup: LazyVim gd
            { "gtd", vim.lsp.buf.type_definition, desc = "Goto Type Definition", has = "typeDefinition" }, -- dup: grt (built-in), gy (LazyVim)
            { "gi", vim.lsp.buf.implementation, desc = "Goto Implementation", has = "implementation" },    -- dup: gri (built-in), gI (LazyVim)
            { "<leader>rn", vim.lsp.buf.rename, desc = "Rename", has = "rename" },                    -- dup: grn (built-in), <leader>cr (LazyVim)
          },
        },
      },
    },
  },
}

-- Duplicates that ALREADY EXIST out of the box (so I don't re-add them) -----
-- Neovim 0.11+ built-in LSP keymaps (gr* prefix), always available on attach:
--   gra -> code action          (dup of LazyVim <leader>ca)
--   grr -> references           (dup of LazyVim gr)
--   grn -> rename               (dup of my <leader>rn, LazyVim <leader>cr)
--   gri -> implementation       (dup of my gi, LazyVim gI)
--   grt -> type definition      (dup of my gtd, LazyVim gy)
--   grx -> run codelens         (dup of LazyVim <leader>cc)
--   gO  -> document symbols
-- LazyVim defaults I rely on as-is (not re-added above):
--   gd -> definition | gr -> references | K -> hover | gK -> signature help
--   <leader>ca -> code action | <leader>cr -> rename | <leader>cf -> format
--   <leader>cc -> run codelens | <leader>cl -> Lsp Info

-- Deliberately NOT remapped (they clash with LazyVim defaults). Say the word
-- and I'll wire them to non-clashing keys:
--   <leader>f   -> format   (clashes: <leader>f is the find/file menu; default is <leader>cf)
--   <leader>cl  -> codelens (clashes: <leader>cl is "Lsp Info";       default is <leader>cc)
--   <leader>sh  -> sig help (clashes: <leader>sh is "Help Pages";     default is gK)
