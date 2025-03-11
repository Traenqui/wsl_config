local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}

M.config = function()
	-- import mason
	local mason = require("mason")

	-- import mason-lspconfig
	local mason_lspconfig = require("mason-lspconfig")
	local mason_tool_installer = require("mason-tool-installer")

	-- enable mason and configure icons
	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	mason_lspconfig.setup({
		-- list of servers for mason to install
		ensure_installed = {
			"tsserver",
			"html",
			"cssls",
			"lua_ls",
			"pylsp",
			"omnisharp",
			"clangd",
			"docker_compose_language_service",
			"dockerls",
			"hls",
			"jdtls",
			"texlab",
			"rnix",
		},
	})

	mason_tool_installer.setup({
		ensure_installed = {
			"prettier", -- prettier formatter
			"stylua", -- lua formatter
			"eslint_d", -- js linter
		},
	})
end

return M
