return {
  {
    "zivyangll/git-blame.vim",
    config = function()
      vim.keymap.set("n", "<Leader>gp", ":<C-u>call gitblame#echo()<CR>", { desc = "Git blame current line" })
    end,
  },
  {
    "airblade/vim-gitgutter",
  },
}
