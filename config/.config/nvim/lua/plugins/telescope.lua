return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-live-grep-args.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          }
        },
        pickers = {
          find_files = {
            hidden = true,
            prompt_prefix = "ᕕ(ᐛ)ᕗ "
          },
          live_grep = {
            prompt_prefix = "╰( ￣ー￣)つ──☆ *・ﾟ"
          },
        },
      })
    end,
  }
}
