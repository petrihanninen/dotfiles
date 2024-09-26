return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
  },
  config = function()
    local telescope = require("telescope")

    -- first setup telescope
    telescope.setup({
      -- your config
    })

    -- then load the extension
    telescope.load_extension("live_grep_args")
  end,
  keys = {
    {
      "<leader><space>",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>sx",
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc = "Find files (ripgrep)",
    },
  },
}
