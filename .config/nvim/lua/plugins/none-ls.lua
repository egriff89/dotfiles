return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            sources = {
                formatting.stylua,
                formatting.prettier,
                formatting.yamlfmt,
                formatting.goimports,
                formatting.isort,
            },
        })
    end,
}
