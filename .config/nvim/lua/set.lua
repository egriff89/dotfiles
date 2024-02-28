-- Fat cursor and cursor line highlight
vim.opt.guicursor = ""
vim.opt.cursorline = true

-- Show line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Set tabs and indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Turn off line wrapping
vim.opt.wrap = false

-- No backups
vim.opt.swapfile = false
vim.opt.backup = false

-- Enable persistent undo history
vim.opt.undofile = true

-- Don't keep searches highlighted
vim.opt.hlsearch = false

-- Highlight searches incrementally
vim.opt.incsearch = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Place a column line
vim.opt.colorcolumn = "80"

-- Always show 8 lines above/below cursor unless at start/end of file 
vim.opt.scrolloff = 8

-- Refresh changed content op opened file (in ms)
vim.opt.updatetime = 50

-- Better splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Misc
vim.g.mapleader = " "
