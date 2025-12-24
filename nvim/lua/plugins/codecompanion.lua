-- ~/.config/nvim/lua/plugins/codecompanion.lua
return {
  {
    "olimorris/codecompanion.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      adapters = {
        -- Use Qwen via Ollama
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "qwen2.5-coder:14b", -- or your custom name
              },
            },
          })
        end,
        -- you can leave copilot out entirely if you don't want it
        -- copilot = false,
      },

      -- 🔴 THIS is what switches from Copilot → Ollama
      strategies = {
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
      },
    },
  },
}
