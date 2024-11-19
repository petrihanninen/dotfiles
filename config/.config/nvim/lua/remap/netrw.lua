Autocmd("filetype", {
  group = P3AutoGroup,
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
