return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").install({
			"lua",
			"vim",
			"vimdoc",
			"c_sharp",
			"typescript",
			"javascript",
			"tsx",
			"html",
			"css",
			"json",
			"bash",
			"markdown",
			"markdown_inline",
		})
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
