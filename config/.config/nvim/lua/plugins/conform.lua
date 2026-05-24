return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["htmldjango"] = { "djlint" },
        python = { "isort", "black" },
      },
      formatters = {
        black = {
          prepend_args = { "--line-length", "160" },
        },
        isort = {
          prepend_args = { "--profile", "black", "--line-length", "120" },
        },
      },
    },
  },
}
