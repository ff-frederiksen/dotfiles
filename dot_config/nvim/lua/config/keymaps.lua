local map = vim.keymap.set

-- Clear search highlight
map("n", "<leader>nh", "<CMD>nohlsearch<CR>", { desc = "Clear highlights" })

-- PLUGINS --
-- OIL
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

