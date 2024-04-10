local M = {
	"mfussenegger/nvim-dap",
	event = "BufReadPost",
	config = function()
		require("config.dap")
	end,
	dependencies = {
		{ "ofirgall/goto-breakpoints.nvim" },
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {
				all_frames = true,
			},
		},
		{
			"mfussenegger/nvim-dap-python",
			config = false,
		},
		{
			"rcarriga/nvim-dap-ui",
			dependencies = {
				"nvim-neotest/nvim-nio",
			},
			config = true,
		},
	},
}

return M
