-- ~/.config/nvim/lua/plugins/copilot.lua

return {
  {
    "github/copilot.vim",
    config = function()
      -- Use Tab to accept Copilot suggestions
      vim.api.nvim_set_keymap("i", "<Tab>", "copilot#Accept('')", { silent = true, expr = true })

      -- Optional: disable default tab completion to avoid conflicts
      vim.g.copilot_no_tab_map = true
    end,
  },
}
