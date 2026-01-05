-- ~/.config/nvim/lua/plugins.lua
return {
  {
    "dhruvasagar/vim-table-mode",
    cmd = { "TableModeToggle" },
    ft = { "markdown", "text", "rmd" },
    config = function()
      vim.keymap.set("n", "<leader>tm", "<cmd>TableModeToggle<cr>", { desc = "Toggle Table Mode" })
    end,
  },

  -- add other plugin specs here...
}
