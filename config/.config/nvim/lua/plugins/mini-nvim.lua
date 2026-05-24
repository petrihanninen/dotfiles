return {
  "nvim-mini/mini.cmdline",
  "nvim-mini/mini.comment",
  "nvim-mini/mini.indentscope",
  "nvim-mini/mini.pairs",
  "nvim-mini/mini.statusline",
  "nvim-mini/mini.surround",
  "nvim-mini/mini.trailspace",
  {
    "nvim-mini/mini.ai",
    version = false,
    config = function()
      local ai = require("mini.ai")
      ai.setup({
        custom_textobjects = {
          o = ai.gen_spec.treesitter({ -- code block
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
          d = { "%f[%d]%d+" },
          e = {
            {
              "%u[%l%d]+%f[^%l%d]",
              "%f[%S][%l%d]+%f[^%l%d]",
              "%f[%P][%l%d]+%f[^%l%d]",
              "^[%l%d]+%f[^%l%d]",
            },
            "^().*()$",
          },
          u = ai.gen_spec.function_call(),
          U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
        },
      })
    end,
  },
}
