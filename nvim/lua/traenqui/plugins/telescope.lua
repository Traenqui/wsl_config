local M = {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
}

M.config = function()
	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			path_display = { "smart" },
			mappings = {
				i = {
					["<C-k>"] = actions.move_selection_previous, -- move to prev result
					["<C-j>"] = actions.move_selection_next, -- move to next result
					["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				},
			},
			file_ignore_patterns = {
				"node_modules",
				"venv",
				".venv",
				"bin",
				"obj",
			},
		},
		pickers = {
			live_grep = {
				file_ignore_patterns = { "node_modules", "venv", ".venv", "bin", "obj", ".git" },
				additional_args = function(_)
					return { "--hidden" }
				end,
			},
			find_files = {
				file_ignore_patterns = { "node_modules", ".git", ".venv" },
				hidden = true,
			},
		},
		extensions = {
			"fzf",
		},
	})

	telescope.load_extension("fzf")
end

M.keys = {
	{ "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "[/] Buffer Search" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[F]ind [B]uffers" },
	{ "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "[F]ind [C]ommits" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]iles" },
	{ "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Git files" },
	{ "<S-h>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
	{ "<leader>fj", "<cmd>Telescope command_history<cr>", desc = "History" },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	{ "<leader>fl", "<cmd>Telescope lsp_references<cr>", desc = "Lsp References" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
	{ "<leader>fr", "<cmd>Telescope live_grep<cr>", desc = "Ripgrep" },
	{ "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
	{ "<leader>ft", "<cmd>Telescope treesitter<cr>", desc = "Treesitter" },
	{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "[F]ind [D]iagnostics" },
}

return M
