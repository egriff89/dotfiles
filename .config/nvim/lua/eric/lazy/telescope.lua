return {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Search [p]roject [f]iles" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Search files in Git repo" })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Grep string" })
    end
}

