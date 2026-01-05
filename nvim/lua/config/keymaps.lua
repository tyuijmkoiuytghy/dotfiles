-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps herocal function run_file()
vim.api.nvim_del_keymap("i", "<Space>t")
vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

vim.api.nvim_del_keymap("n", "<Space>l")
vim.keymap.set("n", "<leader>ll", "<Plug>(vimtex-compile)", { desc = "Compile LaTeX with VimTeX" })

-- LazyVim keymap: <leader>rr runs the current Python file in a persistent ToggleTerm terminal

local map = vim.keymap.set
local Terminal = require("toggleterm.terminal").Terminal

-- Create a persistent Python terminal instance
local py_runner = Terminal:new({
  direction = "horizontal", -- or "vertical" / "float"
  close_on_exit = false,
  hidden = true,
})

map("n", "<leader>rr", function()
  vim.cmd("write") -- save file automatically
  local file = vim.fn.expand("%:p") -- full path to current buffer
  py_runner:toggle() -- open or focus the terminal
  py_runner:send("python3 " .. vim.fn.fnameescape(file) .. "\r")
end, { desc = "Run current Python file (ToggleTerm)" })

-- =============================================
-- Telescope Keymaps
-- =============================================

vim.keymap.set("n", "<leader>T", "<cmd>Telescope<cr>", {
  desc = "Telescope menu",
})

-- Copy current file path to clipboard
vim.keymap.set("n", "<leader>yf", function()
  local filepath = vim.fn.expand("%:p")
  if filepath == "" then
    vim.notify("No file path (buffer not saved yet)", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg("+", filepath)
  vim.notify("Copied file path:\n" .. filepath)
end, { desc = "Yank File Path" })

-- Copy current directory path to clipboard
vim.keymap.set("n", "<leader>yd", function()
  local dirpath = vim.fn.expand("%:p:h")
  if dirpath == "" then
    vim.notify("No directory (buffer not saved yet)", vim.log.levels.WARN)
    return
  end
  vim.fn.setreg("+", dirpath)
  vim.notify("Copied directory path:\n" .. dirpath)
end, { desc = "Yank Directory Path" })

-- Toggle Copilot on/off
vim.keymap.set("n", "<leader>Ct", function()
  local status = vim.g.copilot_enabled
  if status == nil then
    status = true
  end

  if status then
    vim.cmd("Copilot disable")
    vim.g.copilot_enabled = false
    print(" Copilot OFF")
  else
    vim.cmd("Copilot enable")
    vim.g.copilot_enabled = true
    print(" Copilot ON")
  end
end, { desc = "Toggle Copilot" })

-- Open Nnn file explorer
vim.keymap.set("n", "<leader>N", ":NnnExplorer<CR>", { desc = "Open Nnn file explorer" })

-- Open code companion chat
vim.keymap.set("n", "<leader>a", ":CodeCompanionChat<CR>", { desc = "Open Code Companion Chat" })

-- Tab indents
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.api.nvim_del_keymap("v", "S")
