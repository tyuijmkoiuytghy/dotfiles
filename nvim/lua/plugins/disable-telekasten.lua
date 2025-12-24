-- ~/.config/nvim/lua/plugins/disable-telekasten.lua
return {
  -- Completely disable telekasten, even if some other spec tries to load it
  { "renerocksai/telekasten.nvim", enabled = false },

  -- If you ALSO want markview gone for now, uncomment this:
  -- { "OXY2DEV/markview.nvim", enabled = false },
}
