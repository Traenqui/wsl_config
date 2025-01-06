-- Git Blame
return {
	-- https://github.com/f-person/git-blame.nvim
	"f-person/git-blame.nvim",
	event = "VeryLazy",
	opts = {
		enabled = false, -- disable by default, enabled only on keymap
		date_format = "%Y-%m-%d", -- more concise date format
		message_tempalte = " <summary> • <date> • <author> • <<sha>>",
		virtual_text_column = 1,
	},
	config = function()
		vim.keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "Toggle GitBlame" })
	end,
}
