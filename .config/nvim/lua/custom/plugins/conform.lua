return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true }
      end,
      mode = 'n',
      desc = '[F]ormat Buffer',
    },
  },

  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff' },
      go = { 'gofumpt', 'goimports' },
      odin = { 'odinfmt' },
    },
    formatters = {
      odinfmt = {
        command = 'odinfmt',
        args = { '-stdin' },
        stdin = true,
      },
    },
    default_format_opts = { lsp_format = 'fallback' },
    format_on_save = { timeout_ms = 500 },
    notify_on_error = false,
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
