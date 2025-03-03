-- Files
vim.keymap.set("n", "<leader>ff", function()
  Builtin.find_files(require("telescope.themes").get_cursor({ previewer = false }))
end, { desc = "Files: all" })
vim.keymap.set("n", "<leader>fF", Builtin.find_files, { desc = "Files: all (fullscreen)" })
vim.keymap.set("n", "<leader>fg", Builtin.git_files, { desc = "Files: Git" })
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "File Explore" })


-- Git
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
vim.keymap.set("n", "<leader>gc", Builtin.git_commits, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gb", Builtin.git_branches, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gs", Builtin.git_status, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gt", Builtin.git_stash, { desc = "Git sTash" })


-- Search
vim.keymap.set("n", "<leader>ss", Builtin.live_grep, { desc = "Search" })
vim.keymap.set("n", "<leader>sr", Builtin.resume, { desc = "Resume previous search" })
