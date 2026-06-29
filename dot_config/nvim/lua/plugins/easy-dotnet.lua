return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	ft = { "cs" },
	opts = {
		lsp = { enabled = false }, -- use roslyn instead :)
		test_runner = {
			viewmode = "float",
		},
	},
}
