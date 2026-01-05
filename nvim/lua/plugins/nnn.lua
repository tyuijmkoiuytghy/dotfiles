return {
  "luukvbaal/nnn.nvim",
  config = function()
    require("nnn").setup({
      explorer = { cmd = "nnn -H" },
      picker = { cmd = "nnn -H" },
    })
  end,
}
