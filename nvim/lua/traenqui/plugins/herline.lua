local M = {
	"rebelot/heirline.nvim",
	dependencies = { "zeioth/heirline-components.nvim" },
	opts = function()
		local lib = require("heirline-components.all")
		return {
			opts = {
				disable_winbar_cb = function(args) -- We do this to avoid showing it on the greeter.
					local is_disabled = not require("heirline-components.buffer").is_valid(args.buf)
						or lib.condition.buffer_matches({
							buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
							filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
						}, args.buf)
					return is_disabled
				end,
			},
			winbar = { -- UI breadcrumbs bar
				init = function(self)
					self.bufnr = vim.api.nvim_get_current_buf()
				end,
				fallthrough = false,
				-- Winbar for terminal, neotree, and aerial.
				{
					condition = function()
						return not lib.condition.is_active()
					end,
					{
						lib.component.neotree(),
						lib.component.compiler_play(),
						lib.component.fill(),
						lib.component.compiler_build_type(),
						lib.component.compiler_redo(),
						lib.component.aerial(),
					},
				},
				-- Regular winbar
				{
					lib.component.neotree(),
					lib.component.compiler_play(),
					lib.component.fill(),
					lib.component.breadcrumbs(),
					lib.component.fill(),
					lib.component.compiler_redo(),
					lib.component.aerial(),
				},
			},
			statuscolumn = { -- UI left column
				init = function(self)
					self.bufnr = vim.api.nvim_get_current_buf()
				end,
				lib.component.foldcolumn(),
				lib.component.numbercolumn(),
				lib.component.signcolumn(),
			} or nil,
			statusline = { -- UI statusbar
				hl = { fg = "fg", bg = "bg" },
				lib.component.mode(),
				lib.component.git_branch(),
				lib.component.file_info(),
				lib.component.git_diff(),
				lib.component.diagnostics(),
				lib.component.fill(),
				lib.component.cmd_info(),
				lib.component.fill(),
				lib.component.lsp(),
				lib.component.compiler_state(),
				lib.component.virtual_env(),
				lib.component.nav(),
				lib.component.mode({ surround = { separator = "right" } }),
			},
		}
	end,
}

M.config = function(_, opts)
	local heirline = require("heirline")
	local heirline_components = require("heirline-components.all")

	-- Setup
	heirline_components.init.subscribe_to_events()
	heirline.load_colors(heirline_components.hl.get_colors())
	heirline.setup(opts)

	local keymaps = vim.keymap

	keymaps.set("n", "<leader>bx", function()
		require("heirline-components.buffer").wipe()
	end, { desc = "Wipe buffer" })
	keymaps.set("n", "<leader>bX", function()
		require("heirline-components.buffer").close()
	end, { desc = "Close buffer" })
	keymaps.set("n", "<leader>ba", function()
		vim.cmd("wa")
	end, { desc = "Write all buffers" })
	keymaps.set("n", "<leader>bn", function()
		require("heirline-components.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
	end, { desc = "Next Buffer" })
	keymaps.set("n", "<leader>bp", function()
		require("heirline-components.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
	end, { desc = "Previous Buffer" })
	keymaps.set("n", "]b", function()
		require("heirline-components.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
	end, { desc = "Next Buffer" })
	keymaps.set("n", "[b", function()
		require("heirline-components.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
	end, { desc = "Previous Buffer" })
	keymaps.set("n", ">b", function()
		require("heirline-components.buffer").move(vim.v.count > 0 and vim.v.count or 1)
	end, { desc = "Move Buffer tab right" })
	keymaps.set("n", "<p", function()
		require("heirline-components.buffer").move(-(vim.v.count > 0 and vim.v.count or 1))
	end, { desc = "Move Buffer Tab left" })
	keymaps.set("n", "<leader>bc", function()
		require("heirline-components.buffer").close_all(true)
	end, { desc = "Close all buffers except current" })
	keymaps.set("n", "<leader>bC", function()
		require("heirline-components.buffer").close_all()
	end, { desc = "Close all buffers" })
end

return M
