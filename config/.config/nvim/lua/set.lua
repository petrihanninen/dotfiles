vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.numberwidth = 2
vim.opt.history = 500         -- Remember n lines in history
vim.opt.colorcolumn = "100"   -- Show a column at 100 characters

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- Override the 'ignorecase' option if the search pattern contains upper case characters
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.wildmode = "list:longest,list:full" -- Command-line completion mode

vim.opt.list = false                        -- Show invisible characters

vim.opt.conceallevel = 0                    -- Show concealed text

vim.opt.swapfile = false                    -- Don't create swap files

vim.opt.spell = false                       -- Don't spell check

vim.opt.termguicolors = true                -- Enable 24-bit RGB color
vim.opt.updatetime = 100                    -- Faster completion

vim.opt.scrolloff = 8                       -- Keep no lines above and below the cursor when scrolling
vim.opt.cursorline = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu"

vim.opt.signcolumn = "yes:2"
