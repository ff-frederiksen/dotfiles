return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "bashls", "ts_ls", "angularls" },
				automatic_enable = false,
			})

			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.enable({ "lua_ls", "bashls", "ts_ls", "angularls" })

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client and client.name == "angularls" then
						client.server_capabilities.renameProvider = false
					end
					local map = function(k, fn, d)
						vim.keymap.set("n", k, fn, { buffer = ev.buf, desc = d })
					end
					map("gd", vim.lsp.buf.definition, "Definition")
					map("gr", vim.lsp.buf.references, "References")
					map("K", vim.lsp.buf.hover, "Hover")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")
				end,
			})
		end,
	},
}
