local M = {}

function M.default_on_attach(client, bufnr)
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
	end

	map("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "[G]oto [D]efinition")
	map("gl", "<cmd>lua vim.diagnostic.open_float()<CR>", "Show line diagnostic")
	map("gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", "[G]oto [N]ext diagnostics")
	map("gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "[G]oto [P]revious diagnostics")
	map("gr", "<cmd>lua vim.lsp.buf.references()<CR>", "[G]oto [R]eferences")
	map("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]oto [I]mplementation")
	map("<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type [D]efinition")
	map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	map("K", vim.lsp.buf.hover, "Hover Documentation")
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
end

return M