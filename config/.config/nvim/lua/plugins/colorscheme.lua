function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.keymap.set("n", "<leader>§§", function()
	ColorMyPencils()
end)
vim.keymap.set("n", "<leader>§1", function()
	ColorMyPencils("gruvbox")
end)
vim.keymap.set("n", "<leader>§2", function()
	ColorMyPencils("catppuccin")
end)
vim.keymap.set("n", "<leader>§3", function()
	ColorMyPencils("evergarden")
end)

return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			ColorMyPencils()
		end,
	},
	{
		"comfysage/evergarden",
	},
}
