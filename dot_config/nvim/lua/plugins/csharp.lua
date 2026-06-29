return {
	"seblyng/roslyn.nvim",
	ft = { "cs" },
	config = function()
		vim.lsp.config("roslyn", {})

		require("roslyn").setup({
			broad_search = true,
		})
	end,
}
