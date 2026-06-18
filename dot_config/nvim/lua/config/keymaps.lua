local map = vim.keymap.set

-- Clear search highlight
map("n", "<leader>nh", "<CMD>nohlsearch<CR>", { desc = "Clear highlights" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
-- PLUGINS --
-- OIL
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
