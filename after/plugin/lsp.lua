local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local handlers = {
	lsp_zero.default_setup,
	lua_ls = function()
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
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
}

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = handlers,
})
