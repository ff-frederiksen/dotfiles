return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "DAP: toggle breakpoint",
		},
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "DAP: start/continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "DAP: step over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "DAP: step into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "DAP: step out",
		},
		{
			"<leader>dq",
			function()
				require("dap").terminate()
				require("dap").clear_breakpoints()
			end,
			desc = "DAP: terminate + clear breakpoints",
		},
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "DAP: toggle UI",
		},
		{
			"<leader>dR",
			function()
				require("dap").repl.toggle()
			end,
			desc = "DAP: toggle REPL",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()

		dap.listeners.before.attach["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.launch["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.fn.sign_define("DapBreakpoint", {
			text = "●",
			texthl = "DiagnosticError",
			numhl = "",
		})
		vim.fn.sign_define("DapStopped", {
			text = "▶",
			texthl = "DiagnosticOk",
			linehl = "Visual",
			numhl = "",
		})
	end,
}
