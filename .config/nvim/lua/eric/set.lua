-- Fat cursor
vim.opt.guicursor = ""

-- Show line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Turn off line wrapping
vim.opt.wrap = false

-- No backups
vim.opt.swapfile = false
vim.opt.backup = false

-- Location for to store undo list (for UndoTree package)
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Don't keep searches highlighted
vim.opt.hlsearch = false

-- Highlight searches incrementally
vim.opt.incsearch = true

-- Nice terminal colors
vim.opt.termguicolors = true

-- Always show previous 8 lines when scrolling down
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Refresh changed content op opened file (in ms)
vim.opt.updatetime = 750

-- Misc
--vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
