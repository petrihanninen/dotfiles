-- Copy & Paste
vim.keymap.set("x", "<leader>p", [["_dp]], { desc = "Paste without rewriting buffer" })
vim.keymap.set("n", "<leader>p", [["+p]], { desc = "Paste after from system clipboard" })
vim.keymap.set("n", "<leader>P", [["+P]], { desc = "Paste before from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>y<leader>", "^y$", { desc = "Yank line without indentation" })

Autocmd('TextYankPost', {
  group = P3AutoGroup,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 50,
    })
  end,
})
