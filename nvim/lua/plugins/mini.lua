-- ~/.config/nvim/lua/plugins/mini-animate.lua
return {
  {
    "nvim-mini/mini.animate",
    version = "*",
    opts = function(_, opts)
      -- Disable ONLY cursor animation
      opts.cursor = { enable = false }

      return opts
    end,
  },
}
