vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "project view" })

-- Move highlighted text up and down (Visual mode)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Append lines to the end of current line while
-- keeping cursor in same place (default: moves to end of line)
vim.keymap.set("n", "J", "mzJ`z")

-- Jump halfway up/down page, keeping cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- next greatest remap ever : asbjornHaland
-- Yank to system clipboard
vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Yank selected text to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Delete line (normal) or selected text (visual) without copying 
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying" })

-- Disable 'Q' in normal mode
vim.keymap.set("n", "Q", "<nop>")

-- Format text
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format text" })

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace word currently under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word under cursor" })

-- Mark current file as executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Mark current file executable" })

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source current file" })

-- Manage splits
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "New vertical split" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "New horizontal split" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move up one window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move down one window" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move left one window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move right one window" })
vim.keymap.set("n", "<leader>wc", "<C-w>c", { desc = "Close active split" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Close all other windows" })
