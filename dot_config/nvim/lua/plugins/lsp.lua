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
				ensure_installed = { "lua_ls", "bashls" },
				automatic_enable = false,
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

			vim.lsp.enable("lua_ls")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
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
