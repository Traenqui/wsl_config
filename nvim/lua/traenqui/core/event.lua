local autocmd = {}
local cmd = vim.api.nvim_command

function autocmd.nvim_create_augroups(definitions)
	for group_name, definition in ipairs(definitions) do
		cmd("augroup " .. group_name)
		cmd("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			cmd(command)
		end
		cmd("augroup END")
	end
end

local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.py" },
	desc = "Auto-format Python files after saving",
	callback = function()
		local file_name = vim.api.nvim_buf_get_name(0) -- Get file name of file in current buffer
		vim.cmd("silent! !black --preview -q " .. file_name)
		vim.cmd("silent! !isort --profile black --float-to-top -q " .. file_name)
		-- vim.cmd(":!docformatter --in-place --black " .. file_name)
	end,
	group = autocmd_group,
})
