return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- Optional completion integration for `blink.cmp`:
  -- dependencies = { "saghen/blink.cmp" },

  opts = {
    preview = {
      enable = true,
      enable_hybrid_mode = true,

      -- Only attach to markdown-style filetypes
      filetypes = { "markdown", "quarto", "rmd", "typst" },

      -- Use internal icons for code block labels etc.
      icon_provider = "internal",

      -- Reasonable debounce for updates
      debounce = 150,

      -- Show previews in normal / operator-pending / command-line modes
      modes = { "n", "no", "c" },

      -- Enable hybrid mode in normal mode (edit + preview together)
      hybrid_modes = { "n" },

      -- Start with vertical split on the right; we'll mutate this at runtime
      splitview_winopts = {
        split = "right",
      },

      -- Track splitview state so we can cycle orientation from our keymap
      callbacks = {
        on_splitview_open = function(_, _, _)
          vim.g.markview_splitview_open = true
        end,
        on_splitview_close = function(_, _, _)
          vim.g.markview_splitview_open = false
        end,
      },

      -- If you ever want to limit previews to your Obsidian vault only,
      -- uncomment this and adjust the path as needed.
      -- condition = function(buf)
      --   local path = vim.api.nvim_buf_get_name(buf)
      --   return path:match("/Obsidian_Vault/")
      -- end,
    },

    -- ✅ Checkboxes, tables, headings, code blocks, images, etc. are all
    -- enabled by default via the markdown config.
    -- You can customize them later via the wiki's "Markdown" options.

    -- 🔢 Math / LaTeX support (commented out for now; enable later if desired)
    -- Make sure you've installed the `latex` treesitter parser first:
    --   :TSInstall latex
    --
    latex = {
      enable = true,
    },
    -- 📊 Tables:
    tables = {
      enable = true,
      strict = true,
      wrap = false,

      block_decorator = true,
      use_virt_lines = true,

      parts = {
        top = { "╭", "─", "╮", "┬" },
        header = { "│", "│", "│" },
        separator = { "├", "─", "┤", "┼" },
        row = { "│", "│", "│" },
        bottom = { "╰", "─", "╯", "┴" },

        overlap = { "┝", "━", "┥", "┿" },

        align_left = "╼",
        align_right = "╾",
        align_center = { "╴", "╶" },
      },

      hl = {
        top = { "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader" },
        header = { "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader" },
        separator = { "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader", "MarkviewTableHeader" },
        row = { "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder" },
        bottom = { "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder" },

        overlap = { "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder", "MarkviewTableBorder" },

        align_left = "MarkviewTableAlignLeft",
        align_right = "MarkviewTableAlignRight",
        align_center = { "MarkviewTableAlignCenter", "MarkviewTableAlignCenter" },
      },
    },
    -- 📈 Mermaid / diagrams:
    -- Markview doesn't render Mermaid directly; keep using fenced ```mermaid
    -- blocks and an external tool if you want live diagram previews.
  },

  config = function(_, opts)
    require("markview").setup(opts)

    -- State for splitview orientation + open flag
    if vim.g.markview_split_orientation == nil then
      -- "right"  = vertical split on the right
      -- "below"  = horizontal split below
      vim.g.markview_split_orientation = "right"
    end

    if vim.g.markview_splitview_open == nil then
      vim.g.markview_splitview_open = false
    end

    -- Helper: toggle splitview & cycle orientation between vertical <-> horizontal
    local function toggle_splitview_cycle()
      local ok, spec = pcall(require, "markview.spec")
      if not ok then
        vim.cmd("Markview splitToggle")
        return
      end

      -- Flip orientation
      if vim.g.markview_split_orientation == "right" then
        vim.g.markview_split_orientation = "below"
      else
        vim.g.markview_split_orientation = "right"
      end

      spec.config.preview = spec.config.preview or {}
      spec.config.preview.splitview_winopts = spec.config.preview.splitview_winopts or {}
      spec.config.preview.splitview_winopts.split = vim.g.markview_split_orientation

      if vim.g.markview_splitview_open then
        vim.cmd("Markview splitRedraw")
      else
        vim.cmd("Markview splitToggle")
      end
    end

    local map = vim.keymap.set

    -- <leader>mp → Toggle split preview & cycle vertical ↔ horizontal
    map("n", "<leader>mp", toggle_splitview_cycle, { desc = "Markview split preview (cycle v/h)" })

    -- <leader>mP → Toggle preview inline (hybrid mode) for current buffer
    map("n", "<leader>mP", "<cmd>Markview toggle<CR>", { desc = "Markview toggle preview (buffer)" })
    -- <leader>mc → Close previews (disable + close splitview)
    map("n", "<leader>mc", function()
      vim.cmd("Markview Disable")
      vim.cmd("Markview splitClose")
    end, { desc = "Markview close preview(s)" })

    -- Auto-enable preview + hybrid mode for markdown-style files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "quarto", "rmd" },
      callback = function()
        vim.cmd("Markview enable")
        vim.cmd("Markview hybridEnable")
      end,
    })
  end,
}
