return {
  "neovim/nvim-lspconfig",

  dependencies = {
    -- Autocompletion snippets
    "hrsh7th/nvim-cmp",     -- Autocompletion plugin,
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp,
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
    "L3MON4D3/LuaSnip",         -- Snippets plugin

    -- Manage installed LSPs
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Message widget
    "j-hui/fidget.nvim",
  },

  config = function()
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    require("fidget").setup({})
    local lspconfig = require("lspconfig")

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pylsp",
      },
      handlers = {
        -- Automatically install lsps if they don"t exist
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities
          })
        end,

        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          })
        end,

        ["pylsp"] = function()
          lspconfig.pylsp.setup({
            capabilities = capabilities,
            settings = {
              pylsp = {
                -- Pylsp is quite opinionated, just use black
                -- (This is what Duunitori codebase uses, just match all that)
                plugins = {
                  black = { enabled = true },
                  autopep8 = { enabled = false },
                  yapf = { enabled = false },
                  pylint = { enabled = false },
                  pyflakes = { enabled = false },
                  pycodestyle = { enabled = false },
                  pylsp_mypy = { enabled = true },
                  jedi_completion = { fuzzy = true },
                  pyls_isort = { enabled = false },
                },
              },
            },
          })
        end
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
      })
    })
  end
}
