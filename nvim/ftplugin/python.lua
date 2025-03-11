local lspconfig = require("lspconfig")
local default_on_attach = require("traenqui.core.lsp-keymaps")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.opt_local.autoindent = true
vim.opt_local.cindent = true
vim.opt_local.copyindent = true
vim.opt_local.expandtab = true
vim.opt_local.smartindent = true
vim.opt_local.shiftwidth = 4
vim.opt_local.smarttab = true
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 8

-- If venv is found during init reload lsp
local pyright_restarted = false

local function find_venv(start_path)
	-- check current dir
	local venv_path = start_path .. "/.venv"
	if vim.fn.isdirectory(venv_path) == 1 then
		return venv_path
	end

	-- check one level deeper (project/.venv)
	local handle = vim.loop.fs_scandir(start_path)
	if handle then
		while true do
			local name, type = vim.loop.fs_scandir_next(handle)
			if not name then
				break
			end
			if type == "directory" then
				venv_path = start_path .. "/" .. name .. "/.venv"
				if vim.fn.isdirectory(venv_path) == 1 then
					return venv_path
				end
			end
		end
	end
	return nil
end

local function on_attach(client, bufnr)
	-- Call default on_attach
	default_on_attach.default_on_attach(client, bufnr)

	if client.name == "ruff" then
		client.server_capabilities.hoverProvider = false
	end
end

lspconfig.pyright.setup({
	capabilities = capabilities,
	on_init = function()
		if not pyright_restarted then
			local cwd = vim.fn.getcwd()
			local venv_path = find_venv(cwd)

			local nox_path = "~/.local/bin"

			if venv_path then
				print("Venv folder found: " .. venv_path)
				vim.env.VIRTUAL_ENV = venv_path
				vim.env.PATH = venv_path .. "/bin:" .. nox_path .. ":" .. vim.env.PATH

				-- Set the flag to true
				pyright_restarted = true

				vim.schedule(function()
					vim.cmd("LspRestart pyright")
					print("Pyright restarted with new venv settings")
				end)
			else
				print("No venv folder found in or one level below current directory: " .. cwd)
				vim.env.PATH = nox_path .. ":" .. vim.env.PATH
			end
		end
		return true
	end,
	on_attach = on_attach,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				typeCheckingMode = "strict", -- Options: "off", "basic", "strict"
				useLibraryCodeForTypes = true,
				logLevel = "Warning", -- Set the logging level
				diagnosticMode = "workspace", -- Analyze the whole workspace instead of just the open files
				exclude = {
					"**/node_modules",
					"**/__pycache__",
					"**/venv", -- Exclude virtual environment
					"**/.venv", -- Exclude .venv directories
					"**/lib/python*/site-packages", -- Exclude site-packages
				},
				extraPaths = { "./src", "./lib" }, -- Add project-specific paths
				autoImportCompletions = true, -- Enable suggestions for missing imports
				diagnosticSeverityOverrides = {
					-- Ignore missing docstrings in modules, classes, and functions
					["reportMissingModuleDocstring"] = "none",
					["reportMissingClassDocstring"] = "none",
					["reportMissingFunctionDocstring"] = "none",
					["reportOptionalSubscript"] = "warning", -- Adjust severity for specific checks
					["reportUnboundVariable"] = "error",
				},
			},
		},
	},
})

lspconfig.ruff.setup({
	on_attach = on_attach,
	settings = {
		organizeImports = false,
		ignore = {
			"**/venv", -- Exclude virtual environment
			"**/.venv", -- Exclude .venv directories
			"**/lib/python*/site-packages", -- Exclude site-packages
		},
	},
})
