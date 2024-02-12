-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- increment & decrement
local map = vim.api.nvim_set_keymap
map("n", "<M-=>", "<C-a>", {})
map("n", "<M-->", "<C-x>", {})
