return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter").setup({})


			vim.api.nvim_create_autocmd("FileType", {
				group = P3AutoGroup,
				callback = function(ev)
					local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
					if not lang then
						return
					end
					if not pcall(vim.treesitter.language.add, lang) then
						return
					end
					pcall(vim.treesitter.start, ev.buf, lang)
				end,
			})
		end,
	},
	{
		"folke/ts-comments.nvim",
	},
}
