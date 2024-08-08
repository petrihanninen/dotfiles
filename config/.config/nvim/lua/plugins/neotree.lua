return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  branch = "v3.x",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignore = true,
        alway_show = {
          "custom_settings.py",
        },
        always_show_by_pattern = {
          ".env*",
        },
      },
    },
  },
}
