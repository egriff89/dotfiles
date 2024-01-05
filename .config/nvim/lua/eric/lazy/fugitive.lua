return {
    "tpope/vim-fugitive",

    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Search git project" })
    end
}
