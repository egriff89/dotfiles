---@diagnostic disable: unused-local
return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('oil').setup {
      default_file_explorer = true,
      columns = {
        'icon',
        'permissions',
        'size',
      },
      view_options = {
        -- Show hidden files
        show_hidden = true,

        -- Define what a "hidden file" is
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, '.')
        end,

        -- Define what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
      },
    }
  end,
}
