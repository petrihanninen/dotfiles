-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.api.nvim_set_keymap

-- increment & decrement
map("n", "<M-=>", "<C-a>", {})
map("n", "<M-->", "<C-x>", {})

-- Scroll down and up keeping the cursor in the same position
map("n", "<C-b>", "<C-b>zz", {})
map("n", "<C-f>", "<C-f>zz", {})
map("n", "<C-u>", "<C-u>zz", {})
map("n", "<C-d>", "<C-d>zz", {})

-- toggle dark theme and light theme
map("n", "<leader>td", ":set background=dark<cr>", { desc = "Dark theme" })
map("n", "<leader>tl", ":set background=light<cr>", { desc = "Light theme" })

map("n", "<leader>yy", "^y$", { desc = "Yank line without indentation" })
