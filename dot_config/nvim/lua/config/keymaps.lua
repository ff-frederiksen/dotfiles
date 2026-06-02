-- Global keymaps NOT tied to a specific plugin..

local map = vim.keymap.set

-- Clear search highlight
map("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })
