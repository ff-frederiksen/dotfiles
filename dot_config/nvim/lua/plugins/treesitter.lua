return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"markdown",
			"markdown_inline",
			"json",
			"yaml",
			"html",
			"css",
			"scss",
			"javascript",
			"typescript",
			"tsx",
			"python",
			"c_sharp",
			"dockerfile",
			"gitignore",
			"gitcommit",
			"diff",
			"toml",
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
