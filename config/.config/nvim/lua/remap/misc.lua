-- Navigation
vim.keymap.set("n", "<Backspace>", "<C-o>", { desc = "Go to previous location" })


-- Bash
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Chmod +x" })


-- Vim
vim.keymap.set("n", "<leader>vv", function()
  vim.cmd("so")
end, { desc = "Shoutout" })
vim.keymap.set("n", "<leader>vq", "<cmd>qall<CR>", { desc = "Vim Quit" })
vim.keymap.set("n", "<leader>vn", "<cmd>Telescope notify<CR>", { desc = "Vim Notifications" })
vim.keymap.set("n", "<leader>vi", "<cmd>GuessIndent<CR>", { desc = " Vim guess Indentation" })


-- Notify
vim.keymap.set("n", "<leader>vn", ":Telescope notify<CR>", { desc = "Vim Notifications" })


-- Increment & Decrement
vim.keymap.set("n", "<M-=>", "<C-a>", { desc = "++" })
vim.keymap.set("n", "<M-->", "<C-x>", { desc = "--" })
