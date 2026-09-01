-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ============================================================================
-- WINDOWS (Navigate and Move)
-- ============================================================================
-- Alt + direction to focus/navigate between split windows
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Shift + Alt + direction to move the split window itself
vim.keymap.set("n", "<M-S-h>", "<C-w>H", { desc = "Move Window Left", remap = true })
vim.keymap.set("n", "<M-S-j>", "<C-w>J", { desc = "Move Window Down", remap = true })
vim.keymap.set("n", "<M-S-k>", "<C-w>K", { desc = "Move Window Up", remap = true })
vim.keymap.set("n", "<M-S-l>", "<C-w>L", { desc = "Move Window Right", remap = true })

-- ============================================================================
-- BUFFERS (Navigate and Reorder)
-- ============================================================================
-- Ctrl + Alt + direction to navigate between open buffers
vim.keymap.set("n", "<C-M-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<C-M-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Shift + Tab + direction to reorder/drag buffers in the tabline
vim.keymap.set("n", "<S-Tab>h", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Left" })
vim.keymap.set("n", "<S-Tab>l", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Right" })
