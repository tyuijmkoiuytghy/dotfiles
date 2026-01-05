-- ~/.config/nvim/lua/plugins/image.lua
return {
  "3rd/image.nvim",
  build = false, -- use magick_cli (no rock build) [web:1]
  opts = {
    backend = "kitty", -- or "ueberzug" or "sixel"[web:1]
    processor = "magick_cli", -- or "magick_rock"[web:1]

    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false,
        only_render_image_at_cursor_mode = "popup", -- or "inline"[web:1]
        floating_windows = false,
        resolve_image_path = function(document_path, image_path, fallback)
          local obsidian_attachments = "/Users/timothy/Obsidian_Vault/Attachments/" .. image_path
          if vim.fn.filereadable(obsidian_attachments) == 1 then
            return obsidian_attachments
          end
          return fallback(document_path, image_path)
        end,

        filetypes = { "markdown", "vimwiki" },
      },
      neorg = {
        enabled = true,
        filetypes = { "norg" },
      },
      typst = {
        enabled = true,
        filetypes = { "typst" },
      },
      html = {
        enabled = false,
      },
      css = {
        enabled = false,
      },
    },

    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    scale_factor = 1.0,

    window_overlap_clear_enabled = false,
    window_overlap_clear_ft_ignore = {
      "cmp_menu",
      "cmp_docs",
      "snacks_notif",
      "scrollview",
      "scrollview_sign",
    },

    editor_only_render_when_focused = false,
    tmux_show_only_in_active_window = false,

    hijack_file_patterns = {
      "*.png",
      "*.jpg",
      "*.jpeg",
      "*.gif",
      "*.webp",
      "*.avif",
    },
  },
}
