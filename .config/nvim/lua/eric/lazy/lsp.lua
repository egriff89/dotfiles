-- Heavily borrowed from dmmulroy
-- https://github.com/dmmulroy/dotfiles/blob/main/.config/nvim/lua/plugins/lsp.lua

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    dependencies = {
        -- Plugin and UI to automatically install LSPs to stdpath
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- "hrsh7th/cmp-nvim-lsp",

        -- Install none-ls for diagnostics, code actions, and formatting
        "nvimtools/none-ls.nvim",

        -- Install neodev for better nvim configuration and plugin authoring via lsp configurations
        "folke/neodev.nvim",

        -- Progress/Status update for LSP
        { "j-hui/fidget.nvim", tag = "legacy" },
    },

    config = function()
        local null_ls = require("null-ls")

        -- Use neodev to configure lua_ls in nvim directories - must load before lspconfig
        require("neodev").setup()
        
        -- Setup mason so it can manage 3rd party LSP servers
        require("mason").setup({
            ui = {
                border = "rounded",
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = { "tsserver", "eslint", "rust_analyzer"}
        })

        local servers = {
            bashls = {},
            html = {},
            jsonls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enabled = false },
                    },
                },
            },
            marksman = {},
            pyright = {},
            tsserver = {},
            yamlls = {},
        }

        -- Default handlers for LSP
        local default_handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
        }

        -- nvim-cmp supports additional completion capabilities
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- local default_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        ---@diagnostic disable-next-line: unused-local
        local on_attach = function(_client, buffer_number)
            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(buffer_number, "Format", function(_)
                vim.lsp.buf.format({
                    filter = function(format_client)
                        -- Use Prettier to format TS/JS if it's available
                        return format_client.name ~= "tsserver" or not null_ls.is_registered("prettier")
                    end,
                })
            end, { desc = "LSP: Format current buffer with LSP" })

            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end

        -- Iterate over our servers and set them up
        for name, config in pairs(servers) do
            require("lspconfig")[name].setup({
                -- capabilities = default_capabilities,
                filetypes = config.filetypes,
                handlers = vim.tbl_deep_extend("force", {}, default_handlers, config.handlers or {}),
                on_attach = on_attach,
                settings = config.settings,
            })
        end

        -- Congifure LSP linting, formatting, diagnostics, and code actions
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local code_actions = null_ls.builtins.code_actions

        null_ls.setup({
            border = "rounded",
        })

        -- Configure borderd for LspInfo ui
        require("lspconfig.ui.windows").default_options.border = "rounded"

        -- Configure diagostics border
        vim.diagnostic.config({
            float = {
                border = "rounded",
            },
        })
    end
}
