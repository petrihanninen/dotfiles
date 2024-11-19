Autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
P3AutoGroup = augroup("p3", {})


Builtin = require("telescope.builtin")


require("remap.copy_paste")
require("remap.cursor_in_middle")
require("remap.format")
require("remap.lsp")
require("remap.misc")
require("remap.move_lines")
require("remap.netrw")
require("remap.no_neck_pain")
require("remap.quickfix")
require("remap.telescope")
