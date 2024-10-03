return {
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"L3MON4D3/LuaSnip",

		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
			"hrsh7th/cmp-cmdline",
		},

		config = function()
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)

			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
				},
				handlers = {
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})
					end,

					["pylsp"] = function()
						require("lspconfig").pylsp.setup({
							capabilities = capabilities,
							settings = {
								pylsp = {
									plugins = {
										pycodestyle = {
											ignore = { "E501" },
										},
									},
								},
							},
						})
					end,
				},
			})

			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<TAB>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})

			vim.diagnostic.config({
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					souree = "never",
					header = "",
					prefix = "",
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.djlint,
				},
				-- on_attach = function(client, bufnr)
				-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
				-- if client.supports_method("textDocument/formatting") then
				-- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				-- vim.api.nvim_create_autocmd("BufWritePre", {
				-- group = augroup,
				-- buffer = bufnr,
				-- callback = function()
				-- vim.lsp.buf.format()
				-- end,
				-- })
				-- end
				-- end,
			})
		end,
	},
}
