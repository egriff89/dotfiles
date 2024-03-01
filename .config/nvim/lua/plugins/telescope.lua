return {
  "nvim-telescope/telescope-ui-select.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case", -- also, "ignore_case" or "respect_case"
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search project files" })
      vim.keymap.set("n", "<leader>gf", builtin.live_grep, { desc = "Grep in files" })

      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}
