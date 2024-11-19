-- Better scrolling: always keep cursor in the middle
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll up" })
vim.keymap.set("n", "<C-b>", "10kzz", { desc = "Scroll a bit up" })
vim.keymap.set("n", "<C-f>", "10jzz", { desc = "Scroll a bit down" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev match" })
vim.keymap.set("n", "j", "jzz", { desc = "Next line" })
vim.keymap.set("n", "k", "kzz", { desc = "Prev line" })
vim.keymap.set("n", "*", "*zz", { desc = "Next word match under cursor" })
vim.keymap.set("n", "#", "#zz", { desc = "Prev word match under cursor" })
vim.keymap.set("n", "gg", "ggzz", { desc = "Top of file" })
vim.keymap.set("n", "G", "Gzz", { desc = "Bottom of file" })
vim.keymap.set("n", "gj", "gjzz", { desc = "?" })
vim.keymap.set("n", "gk", "gkzz", { desc = "?" })
