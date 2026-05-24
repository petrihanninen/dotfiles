Autocmd("LspAttach", {
  group = P3AutoGroup,
  callback = function(e)
    local opts = { buffer = e.buf }

    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts, { desc = "Hover info" })

    -- Code Symbols
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts, { desc = "Go to Definition" })
    vim.keymap.set("n", "gt", function()
      vim.lsp.buf.type_definition()
    end, opts, { desc = "Go to Type definition" })
    vim.keymap.set("n", "gr", function()
      vim.lsp.buf.references()
    end, opts, { desc = "Go to References" })
    vim.keymap.set("n", "<leader>cs", Builtin.lsp_document_symbols, { desc = "Code Symbols" })

    -- Diagnostics
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_next()
    end, opts, { desc = "Next Diagnostics" })
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_prev()
    end, opts, { desc = "Prev Diagnostics" })

    -- Code actions
    vim.keymap.set({ "n", "v" }, "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts, { desc = "Code Actions" })
    vim.keymap.set("n", "<leader>cf", function()
      require("conform").format({ async = false, timeout_ms = 5000, lsp_format = "fallback" })
    end, { desc = "Code Format" })
    vim.keymap.set("n", "<leader>cF", ":FormatToggle<CR>", { desc = "Toggle format on save" })

    -- Misc
    vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Code Mason: open" })
    vim.keymap.set("n", "<leader>ci", "<cmd>LspInfo<CR>", { desc = "Code Info (LSP)" })
  end,
})
