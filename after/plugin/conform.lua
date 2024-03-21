require("conform").setup({
	notify_on_error = false,
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		html = { "prettier" },
		angular = { "prettier", "--parser=angular" },
		bash = { "shfmt" },
		go = { "gofmt", "goimports" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
