return {
    { "folke/neodev.nvim", opts = {} },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("neodev").setup({})

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.pylsp.setup({
                capabilities = capabilities,
            })
            lspconfig.ruff_lsp.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.eslint.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "View references" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
        end,
    },
}
