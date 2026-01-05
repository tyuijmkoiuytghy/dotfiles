-- ~/.config/nvim/lua/plugins/obsidian.lua
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    legacy_commands = false,

    -- Your vault
    workspaces = {
      {
        name = "vault",
        path = "/Users/timothy/Obsidian_Vault",
      },
    },

    -- New notes go in the vault root
    notes_subdir = ".",
    new_notes_location = "notes_subdir",

    -- Use Obsidian-style wiki links [[like this]]
    preferred_link_style = "wiki",

    -- Blink completion (nvim-cmp off)
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },

    -- Daily notes = Random notes ig 😭
    daily_notes = {
      folder = "Random notes ig 😭",
      date_format = "%Y-%m-%d",
      alias_format = "%Y-%m-%d",
      template = "Daily Note Template.md",
    },

    -- Templates in Templates/
    templates = {
      folder = "Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- If you ever want to hard-wire a default template for :Obsidian new:
      -- default_template = "Regular Note template.md",
    },

    -- Pretty wiki links / checkboxes / etc.
    ui = {
      enable = true,
      -- Everything else here is optional; uncomment to tweak later:
      -- update_debounce = 200,
      -- max_file = 5000,
      -- checkboxes = { },
      -- bullets = { },
    },

    -- Use gf to follow/create notes from links
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },

      -- More smart mappings you can enable later if you want:
      -- ["<CR>"] = {
      --   action = function()
      --     return require("obsidian").util.smart_action()
      --   end,
      --   opts = { buffer = true, expr = true },
      -- },
    },

    -- Example extras for later (all commented for now):

    -- picker = {
    --   name = "telescope.nvim",
    -- },

    -- statusline = {
    --   enabled = true,
    --   format = "{{backlinks}} backlinks | {{words}} words",
    -- },

    -- Custom frontmatter example (default already gives full frontmatter
    -- with id, aliases, tags — uncomment only if you want to customize):
    -- note_frontmatter_func = function(note)
    --   if note.title then
    --     note:add_alias(note.title)
    --   end
    --
    --   local out = {
    --     id = note.id,
    --     aliases = note.aliases,
    --     tags = note.tags,
    --   }
    --
    --   if note.metadata and not vim.tbl_isempty(note.metadata) then
    --     for k, v in pairs(note.metadata) do
    --       out[k] = v
    --     end
    --   end
    --
    --   return out
    -- end,
  },

  -- Minimal keymaps
  keys = {
    { "<leader>on", "<cmd>Obsidian new<CR>", desc = "Obsidian: New note" },
    { "<leader>ot", "<cmd>Obsidian today<CR>", desc = "Obsidian: Today (daily)" },
    { "<leader>oo", "<cmd>Obsidian open<CR>", desc = "Obsidian: Open in app" },

    -- Uncomment any of these if/when you want more commands:
    -- { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Obsidian: Backlinks" },
    -- { "<leader>os", "<cmd>Obsidian search<CR>",    desc = "Obsidian: Search" },
    -- { "<leader>oq", "<cmd>Obsidian quick_switch<CR>", desc = "Obsidian: Quick switch" },
    -- { "<leader>otg", "<cmd>Obsidian tags<CR>",     desc = "Obsidian: Tags" },
    -- { "<leader>otc", "<cmd>Obsidian template<CR>", desc = "Obsidian: Insert template" },
  },
}
