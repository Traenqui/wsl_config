local M = { -- LSP Configuration
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		-- LSP Management
		-- https://github.com/williamboman/mason.nvim
		{ "williamboman/mason.nvim" },
		-- https://github.com/williamboman/mason-lspconfig.nvim
		{ "williamboman/mason-lspconfig.nvim" },

		-- Auto-Install LSPs, linters, formatters, debuggers
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

		-- Useful status updates for LSP
		-- https://github.com/j-hui/fidget.nvim
		{ "j-hui/fidget.nvim", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		-- https://github.com/folke/neodev.nvim
		{ "folke/neodev.nvim" },
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			-- Install these LSPs automatically
			ensure_installed = {
				"bashls",
				"cssls",
				"html",
				"lua_ls",
				"jsonls",
				"lemminx",
				"marksman",
				"quick_lint_js",
				"yamlls",
				"pyright",
				"jdtls",
				"csharp_ls",
			},
		})

		require("mason-tool-installer").setup({
			-- Install these linters, formatters, debuggers automatically
			ensure_installed = {
				-- python
				"black",
				"debugpy",
				"flake8",
				"mypy",
				"pylint",

				-- toml
				"taplo",

				-- Java
				"java-debug-adapter",
				"java-test",

				-- C#
				"csharpier",

				-- SQL
				"sqlfluff",
			},
		})

		-- LSP Signs
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.diagnostic.config({
			underline = false,
			virtual_text = false,
			signs = true,
			severity_sort = true,
		})

		-- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
		vim.api.nvim_command("MasonToolsInstall")

		local lspconfig = require("lspconfig")

		-- Default handler for LSP servers
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				if server_name ~= "jdtls" then
					lspconfig[server_name].setup({
						on_attach = require("traenqui.core.lsp-keymaps").default_on_attach,
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end
			end,
		})
	end,
}

return M
