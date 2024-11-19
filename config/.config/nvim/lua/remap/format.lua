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

Autocmd("BufWritePre", {
  group = P3AutoGroup,
  pattern = "*",
  desc = "Format code on save",
  callback = function()
    if not vim.b.disable_autoformat then
      vim.lsp.buf.format()
    end
  end,
})

Autocmd("BufWritePost", {
  group = P3AutoGroup,
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
