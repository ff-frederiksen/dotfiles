return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"bash",
			"c_sharp",
			"c_sharp",
			"css",
			"diff",
			"dockerfile",
			"gitcommit",
			"gitignore",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"scss",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		}

		require("nvim-treesitter").install(parsers)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
