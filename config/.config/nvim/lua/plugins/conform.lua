return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["htmldjango"] = { "djlint" },
        python = { "isort", "black" },
      },
    },
  },
}
