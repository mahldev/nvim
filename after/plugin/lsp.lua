local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local mappings = {
	{ "n", "<leader>cr", vim.lsp.buf.rename },
	{
		"n",
		"<leader>ca",
		function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source" },
				},
			})
		end,
	},
}

local ensure_installed = {
	"lua_ls",
	"jdtls",
	"angularls",
	"tsserver",
	"jsonls",
}

local handlers = {
	lsp_zero.default_setup,
	lua_ls = function()
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						library = {
							"${3rd}/luv/library",
							unpack(vim.api.nvim_get_runtime_file("", true)),
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		})
	end,
	gopls = function()
		lspconfig.gopls.setup({
			cmd = { "gopls", "serve" },
			settings = {
				gopls = {
					gofumpt = true,
					codelenses = {
						gc_details = false,
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
					analyses = {
						fieldalignment = true,
						nilness = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					semanticTokens = true,
				},
			},
		})
	end,
	jdtls = function()
		lspconfig.jdtls.setup({
			cmd = {
				"jdtls",
				"--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand("$HOME/.local/share/java/lombok.jar")),
			},
		})
	end,
	angularls = function()
		lspconfig.angularls.setup({
			root_dir = util.root_pattern("angular.json", "project.json"),
			filetypes = { "angular", "html", "typescript", "typescriptreact" },
		})
	end,
	jsonls = function()
		lspconfig.jsonls.setup({
			filetypes = { "json" },
		})
	end,
}

lsp_zero.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr }
	local map = function(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, opts)
	end

	for _, keymap in pairs(mappings) do
		map(keymap[1], keymap[2], keymap[3])
	end

	lsp_zero.default_keymaps(opts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = ensure_installed,
	handlers = handlers,
})
