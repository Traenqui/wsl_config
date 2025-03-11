local M = {
	"akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm", "TermExec" },
	opts = {
		highlights = {
			Normal = { link = "Normal" },
			NormalNC = { link = "NormalNC" },
			NormalFloat = { link = "Normal" },
			FloatBorder = { link = "FloatBorder" },
			StatusLine = { link = "StatusLine" },
			StatusLineNC = { link = "StatusLineNC" },
			WinBar = { link = "WinBar" },
			WinBarNC = { link = "WinBarNC" },
		},
		size = 10,
		open_mapping = [[<F7>]],
		shading_factor = 2,
		direction = "float",
		float_opts = {
			border = "rounded",
			highlights = { border = "Normal", background = "Normal" },
		},
	},
}

M.config = function()
	require("toggleterm").setup({})
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]])
	vim.api.nvim_buf_set_keymap(0, "t", "kj", [[<C-\><C-n>]])
	vim.api.nvim_buf_set_keymap(
		0,
		"t",
		"<C-h>",
		[[<C-\><C-n><C-W>h]],
		{ noremap = true, silent = true, desc = "terminal: Focus left" }
	)
	vim.api.nvim_buf_set_keymap(
		0,
		"t",
		"<C-j>",
		[[<C-\><C-n><C-W>j]],
		{ noremap = true, silent = true, desc = "terminal: Focus up" }
	)
	vim.api.nvim_buf_set_keymap(
		0,
		"t",
		"<C-k>",
		[[<C-\><C-n><C-W>k]],
		{ noremap = true, silent = true, desc = "terminal: Focus down" }
	)
	vim.api.nvim_buf_set_keymap(
		0,
		"t",
		"<C-l>",
		[[<C-\><C-n><C-W>l]],
		{ noremap = true, silent = true, desc = "terminal: Focus right" }
	)
end

return M
