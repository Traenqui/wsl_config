return {
	-- https://github.com/mfussenegger/nvim-dap-python
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		-- https://github.com/mfussenegger/nvim-dap
		"mfussenegger/nvim-dap",
	},
	config = function()
		-- Update the path passed to setup to point to your system or virtual env python binary
		require("dap-python").setup("~/.venvs/debugpy/bin/python") --@diagonstic disable-line: missing-fields
		require("dap-python").default_port = 38000
	end,
}
