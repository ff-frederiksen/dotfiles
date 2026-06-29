return {
	"GustavEikaas/easy-dotnet.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
	ft = { "cs" },
	opts = {
		lsp = { enabled = false }, -- use roslyn instead :)
		test_runner = {
			viewmode = "float",
		},
		debugger = {
			bin_path = nil,
			engine = "netcoredbg",
			console = "integratedTerminal",
			auto_register_dap = true,
		},
	},
}
