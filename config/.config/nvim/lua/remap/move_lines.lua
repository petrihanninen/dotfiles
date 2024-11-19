-- Move lines up and down
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gvzz", { desc = "Move line down" })
vim.keymap.set("n", "<M-j>", "mzyyjp`z2jmz2kdd`zzz", { desc = "Move line down" })

vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gvzz", { desc = "Move line up" })
vim.keymap.set("n", "<M-k>", "mzyykP`z2kmz2jdd`zzz", { desc = "Move line up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Squash line below" })
