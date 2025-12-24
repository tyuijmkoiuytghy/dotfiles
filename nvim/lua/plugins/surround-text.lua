return {
  -- 1) Disable Flash's Treesitter mode (which uses "S")
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        treesitter = { enabled = false },
      },
    },
  },

  -- 2) Map visual "S" to nvim-surround
  {
    "kylechui/nvim-surround",
    opts = {
      keymaps = {
        visual = "S", -- select text in visual, press S, then a character
        visual_line = "gS",
      },
    },
  },
}
