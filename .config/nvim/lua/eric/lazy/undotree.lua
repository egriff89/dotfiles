return {
    "mbbill/undotree",

    config = function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeTogglei, { desc = "Toggle Undotree" })
    end
}

