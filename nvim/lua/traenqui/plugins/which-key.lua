return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		-- require("which-key").register({
		-- 	-- ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
		-- 	-- ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
		-- 	-- ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
		-- 	["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
		-- 	-- ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
		-- })

		require("which-key").add({
			{ "<leader>f", group = "[F]ind" },
		})
	end,
}
