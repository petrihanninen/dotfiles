return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon.setup({})
		vim.keymap.set("n", "<leader>hh", function()
			harpoon:list():add()
		end, { desc = "Harpoon add file" })
		vim.keymap.set("n", "<leader>hj", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon quick menu" })
		vim.keymap.set("n", "<leader>hk", function()
			harpoon:list():clear()
		end, { desc = "Harpoon clear list" })
		vim.keymap.set("n", "<leader>hf", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon select 1" })
		vim.keymap.set("n", "<leader>hd", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon select 2" })
		vim.keymap.set("n", "<leader>hs", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon select 3" })
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon select 4" })
	end
	}
