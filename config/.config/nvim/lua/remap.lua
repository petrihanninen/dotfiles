local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local p3AutoGroup = augroup("p3", {})


-- Increment & Decrement
vim.keymap.set("n", "<M-=>", "<C-a>", { desc = "++" })
vim.keymap.set("n", "<M-->", "<C-x>", { desc = "--" })


-- Navigation
vim.keymap.set("n", "<Backspace>", "<C-o>", { desc = "Go to previous location" })


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


-- Move lines up and down
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gvzz", { desc = "Move line down" })
vim.keymap.set("n", "<C-j>", "mzyyjp`z2jmz2kdd`zzz", { desc = "Move line down" })

vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gvzz", { desc = "Move line up" })
vim.keymap.set("n", "<C-k>", "mzyykP`z2kmz2jdd`zzz", { desc = "Move line up" })


-- Copy & Paste
vim.keymap.set("x", "<leader>p", [["_dp]], { desc = "Paste without rewriting buffer" })
vim.keymap.set("n", "<leader>p", [["+p]], { desc = "Paste after from system clipboard" })
vim.keymap.set("n", "<leader>P", [["+P]], { desc = "Paste before from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>y<leader>", "^y$", { desc = "Yank line without indentation" })


-- TELESCOPE
-- Files
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files(require("telescope.themes").get_cursor({ previewer = false }))
end, { desc = "Files: all" })
vim.keymap.set("n", "<leader>fF", builtin.find_files, { desc = "Files: all (fullscreen)" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Files: Git" })
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex, { desc = "File Explore" })


-- Git
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gt", builtin.git_stash, { desc = "Git sTash" })


-- Search
vim.keymap.set("n", "<leader>ss", builtin.live_grep, { desc = "Search" })


-- No Neck Pain
vim.keymap.set("n", "<leader>nn", "<cmd>NoNeckPain<CR>", { desc = "No Neck pain" })
vim.keymap.set("n", "<leader>nf", "<cmd>NoNeckPainWidthUp<CR>", { desc = "No neck pain width up" })
vim.keymap.set("n", "<leader>nd", "<cmd>NoNeckPainWidthDown<CR>", { desc = "No neck pain width Down" })
vim.keymap.set("n", "<leader>ns", "<cmd>NoNeckPainResize 130<CR>", { desc = "No neck pain reset wide" })
vim.keymap.set("n", "<leader>na", "<cmd>NoNeckPainResize 100<CR>", { desc = "No neck pain reset narrow" })


-- Misc
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Chmod +x" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Squash line below" })


-- Vim
vim.keymap.set("n", "<leader>vv", function()
  vim.cmd("so")
end, { desc = "Shoutout" })
vim.keymap.set("n", "<leader>vq", "<cmd>qall<CR>", { desc = "Vim Quit" })
vim.keymap.set("n", "<leader>vn", "<cmd>Telescope notify<CR>", { desc = "Vim Notifications" })
vim.keymap.set("n", "<leader>vi", "<cmd>GuessIndent<CR>", { desc = " Vim guess Indentation" })


-- Quickfix list
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Next Quickfix list item" })
vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Prev Quickfix list item" })
vim.keymap.set("n", "|", "<cmd>cprev<CR>zz", { desc = "Next Quickfix list item" })
vim.keymap.set("n", "\\", "<cmd>cnext<CR>zz", { desc = "Prev Quickfix list item" })
vim.keymap.set("n", "<leader>qq", "<cmd>cclose<CR>", { desc = "Quickfix Quit" })

vim.keymap.set("n", "<leader>vn", ":Telescope notify<CR>", { desc = "Vim Notifications" })

-- Allow enabling and disabling auto-format
vim.api.nvim_create_user_command("FormatDisable", function()
  vim.b.disable_autoformat = true
end, {
  desc = "Disable format on save",
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
end, {
  desc = "Enable format on save",
})

vim.api.nvim_create_user_command("FormatToggle", function()
  vim.b.disable_autoformat = not vim.b.disable_autoformat
  if vim.b.disable_autoformat then
    vim.notify("Format on save disabled")
  else
    vim.notify("Format on save enabled")
  end
end, {
  desc = "Toggle format on save",
})


autocmd("filetype", {
  group = p3AutoGroup,
  pattern = "netrw",
  desc = "Better mappings for netrw",
  callback = function()
    local bind = function(lhs, rhs, opts)
      vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true }, opts)
    end

    bind("a", "%", { desc = "Add file" })
    bind("r", "R", { desc = "Rename file" })
    bind("<Backspace>", "-", { desc = "Go up dir" })
  end,
})

autocmd("BufWritePre", {
  group = p3AutoGroup,
  pattern = "*",
  desc = "Format code on save",
  callback = function()
    if not vim.b.disable_autoformat then
      vim.lsp.buf.format()
    end
  end,
})

autocmd("BufWritePost", {
  group = p3AutoGroup,
  pattern = "*",
  desc = "Notify about formatting",
  callback = function()
    if vim.b.disable_autoformat then
      vim.notify("File saved without formatting", "warn")
    else
      vim.notify("File formatted and saved")
    end
  end,
})

autocmd('TextYankPost', {
  group = p3AutoGroup,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 50,
    })
  end,
})

autocmd("LspAttach", {
  group = p3AutoGroup,
  callback = function(e)
    local opts = { buffer = e.buf }

    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts, { desc = "Hover info" })

    -- Code Symbols
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts, { desc = "Go to Definition" })
    vim.keymap.set("n", "gt", function()
      vim.lsp.buf.type_definition()
    end, opts, { desc = "Go to Type definition" })
    vim.keymap.set("n", "gr", function()
      vim.lsp.buf.references()
    end, opts, { desc = "Go to References" })
    vim.keymap.set("n", "<leader>cs", builtin.lsp_document_symbols, { desc = "Code Symbols" })

    -- Diagnostics
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_next()
    end, opts, { desc = "Next Diagnostics" })
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, opts, { desc = "Prev Diagnostics" })

    -- Code actions
    vim.keymap.set({ "n", "v" }, "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts, { desc = "Code Actions" })
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Format" })
    vim.keymap.set("n", "<leader>cF", ":FormatToggle<CR>", { desc = "Toggle format on save" })

    -- Misc
    vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Code Mason: open" })
    vim.keymap.set("n", "<leader>ci", "<cmd>LspInfo<CR>", { desc = "Code Info (LSP)" })

    -- Some keymaps from primeagen to check out
    -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts, { desc = "" })
    -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts, { desc = "" })
    -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts, { desc = "" })
    -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts, { desc = "" })
  end,
})
