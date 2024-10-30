-- Left side
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes:2"

-- Right side
vim.opt.colorcolumn = "120"

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Search
-- Ignore case unless there are caps in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Highlight search results when typing
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Swap & undo stuff
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = false

-- Tab completion
vim.opt.wildmode = "list:longest"

-- Invisible characters
vim.opt.list = true
vim.opt.listchars = "leadmultispace:| ,tab:| "

-- Misc
vim.opt.history = 1000
vim.opt.spell = false
vim.opt.termguicolors = true
vim.opt.updatetime = 100
vim.opt.scrolloff = 8
vim.opt.cursorline = true
