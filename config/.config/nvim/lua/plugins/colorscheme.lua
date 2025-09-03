vim.g.colorscheme_index = 1

local key = "="

local colorschemes = {
	"catppuccin",
	"gruvbox",
	"evergarden",
	"no-clown-fiesta",
	"rose-pine",
	"mellow",
}

function ColorMyPencils(i)
	vim.g.colorscheme_index = i
	local colorscheme = colorschemes[i]

	vim.cmd.colorscheme(colorscheme)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.notify("Set colorscheme to " .. colorscheme)
end

function RandomColor()
	local i = math.random(#colorschemes)
	ColorMyPencils(i)
end

function NextColor()
	local i = vim.g.colorscheme_index + 1
	if i >= #colorschemes then
		i = 0
	end

	ColorMyPencils(i)
end

vim.keymap.set("n", string.format("<leader>§§", key, key), function()
	RandomColor()
end, {
	desc = "Random Color",
})
vim.keymap.set("n", string.format("<leader>§1", key), function()
	ColorMyPencils(1)
end)
vim.keymap.set("n", string.format("<leader>§2", key), function()
	ColorMyPencils(2)
end)
vim.keymap.set("n", string.format("<leader>§3", key), function()
	ColorMyPencils(3)
end)
vim.keymap.set("n", string.format("<leader>§4", key), function()
	ColorMyPencils(4)
end)
vim.keymap.set("n", string.format("<leader>§5", key), function()
	ColorMyPencils(5)
end)
vim.keymap.set("n", string.format("<leader>§6", key), function()
	ColorMyPencils(6)
end)
vim.keymap.set("n", string.format("<leader>§7", key), function()
	ColorMyPencils(7)
end)
vim.keymap.set("n", string.format("<leader>§8", key), function()
	ColorMyPencils(8)
end)
vim.keymap.set("n", string.format("<leader>§9", key), function()
	ColorMyPencils(9)
end)
vim.keymap.set("n", string.format("<leader>§0", key), function()
	NextColor()
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
			ColorMyPencils(vim.g.colorscheme_index)
		end,
	},
	{
		"comfysage/evergarden",
	},
	{
		"aktersnurra/no-clown-fiesta.nvim",
	},
	{
		"rose-pine/neovim",
	},
	{
		"mellow-theme/mellow.nvim",
	},
}
