-- ~/.config/nvim/lua/plugins/dashboard-ascii.lua
return {
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      if not dashboard.section or not dashboard.section.header then
        return dashboard
      end

      ------------------------------------------------------------------
      -- 1) Your ASCII
      ------------------------------------------------------------------
      dashboard.section.header.val = {
        "░██     ░██ ░██     ░██ ░███     ░███ ░███     ░███ ░██     ░██ ░██    ░██ ░██████░███     ░███ ",
        " ░██   ░██  ░██     ░██ ░████   ░████ ░████   ░████  ░██   ░██  ░██    ░██   ░██  ░████   ░████ ",
        "  ░██ ░██   ░██     ░██ ░██░██ ░██░██ ░██░██ ░██░██   ░██ ░██   ░██    ░██   ░██  ░██░██ ░██░██ ",
        "   ░████    ░██     ░██ ░██ ░████ ░██ ░██ ░████ ░██    ░████    ░██    ░██   ░██  ░██ ░████ ░██ ",
        "    ░██     ░██     ░██ ░██  ░██  ░██ ░██  ░██  ░██     ░██      ░██  ░██    ░██  ░██  ░██  ░██ ",
        "    ░██      ░██   ░██  ░██       ░██ ░██       ░██     ░██       ░██░██     ░██  ░██       ░██ ",
        "    ░██       ░██████   ░██       ░██ ░██       ░██     ░██        ░███    ░██████░██       ░██ ",
        "                                                                                                 ",
        "                                                                                                 ",
      }

      ------------------------------------------------------------------
      -- 2) Change this hex to test colors
      ------------------------------------------------------------------
      local ascii_color = "#f38ba8" -- ← just change this hex

      -- optional style flags
      local ascii_bold = true
      local ascii_italic = false

      ------------------------------------------------------------------
      -- 3) Define a highlight group and apply it to the header
      ------------------------------------------------------------------
      vim.api.nvim_set_hl(0, "DashboardAscii", {
        fg = ascii_color,
        bold = ascii_bold,
        italic = ascii_italic,
      })

      dashboard.section.header.opts.hl = "DashboardAscii"

      return dashboard
    end,
  },
}
