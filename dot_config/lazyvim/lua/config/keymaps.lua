-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

set("n", "<cr>", "<cmd>w<cr>", { silent = true, desc = "Save file on typing enter" })

set("n", "<c-j>", "<cmd>cnext<cr>", { silent = true, desc = "Quickfix next" })
set("n", "<c-k>", "<cmd>cprev<cr>", { silent = true, desc = "Quickfix previous" })

set("i", "<c-k>", "<esc>diWi")
set("i", "<c-l>", "<esc>ddo")

-- Telescope
local builtin = require("telescope.builtin")
set("n", "<c-f>", builtin.find_files, { desc = "Telescope find files" })
