return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup({})

      local parsers = {
        "bash",
        "dockerfile",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "python",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      }

      require("nvim-treesitter").install(parsers)

			local function start_hl(bufnr, lang)
				if vim.api.nvim_buf_is_valid(bufnr) then
					pcall(vim.treesitter.start, bufnr, lang)
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				group = P3AutoGroup,
				callback = function(ev)
					local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
					if not lang then
						return
					end

					if pcall(vim.treesitter.language.add, lang) then
						start_hl(ev.buf, lang)
						return
					end

					local ok, task = pcall(require("nvim-treesitter").install, { lang })
					if not ok or not task then
						return
					end
					if type(task) == "table" and task.await then
						task:await(vim.schedule_wrap(function()
							start_hl(ev.buf, lang)
						end))
					end
				end,
			})
		end,
	},
	{
		"folke/ts-comments.nvim",
	},
}
