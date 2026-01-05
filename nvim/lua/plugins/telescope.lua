return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function(_, opts)
    -- thin vertical bar as your “accent bar” selection
    local selection_caret = "┃ "

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      -- layout: centered floating palette
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.50, -- 50% width
        height = 0.50, -- 50% height
        preview_width = 0.55, -- wide preview
        prompt_position = "bottom", -- prompt on bottom
      },

      sorting_strategy = "ascending",

      -- floating window look
      border = true,
      winblend = 25, -- noticeably transparent
      results_title = "Results",
      preview_title = "Preview",

      -- medium density
      dynamic_preview_title = false,
      -- subtle match highlight & clean list (most of this comes from your colorscheme)
      selection_caret = selection_caret,
      path_display = { "smart" }, -- smart truncate
      prompt_prefix = " ", -- keep default-ish
      multi_icon = "·", -- minimal marker
      -- no footer help
      show_line = false,
    })

    return opts
  end,
}
