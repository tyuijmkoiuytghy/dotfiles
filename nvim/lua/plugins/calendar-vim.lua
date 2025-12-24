return {
  "renerocksai/telekasten.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "mattn/calendar-vim", -- REQUIRED for calendar
  },
  config = function()
    require("telekasten").setup({
      home = vim.fn.expand("~/zettelkasten"),
      plug_into_calendar = true, -- enables calendar
    })
  end,
}
