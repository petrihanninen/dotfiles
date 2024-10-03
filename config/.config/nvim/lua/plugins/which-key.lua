return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		keys = {
			scroll_down = "<Down>", -- binding to scroll down inside the popup
			scroll_up = "<Up>", -- binding to scroll up inside the popup
		},
	},
	keys = {
		{
			"?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
