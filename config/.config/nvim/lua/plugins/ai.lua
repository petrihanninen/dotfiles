return {
  -- { "github/copilot.vim", }
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_succession = "<Tab>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-Tab>",
        },
      })
    end,
  }
}
