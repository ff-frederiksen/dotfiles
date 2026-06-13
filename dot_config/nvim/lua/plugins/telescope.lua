return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		{
			"<leader>fc",
			function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end,
			desc = "Find config files",
		},
		{
			"<leader>fC",
			function()
				require("telescope.builtin").live_grep({
					cwd = vim.fn.stdpath("config"),
				})
			end,
			desc = "Grep config files",
		},
	},
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
}
