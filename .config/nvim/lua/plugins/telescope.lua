return {
    "nvim-telescope/telescope-ui-select.nvim",
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search [p]roject [f]iles" })
            vim.keymap.set("n", "<leader>gf", builtin.live_grep, { desc = "Grep in files" })

            require("telescope").load_extension("ui-select")
        end,
    },
}
