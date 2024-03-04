local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_format = require("lsp-zero").cmp_format({ details = true })

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documention = cmp.config.window.bordered(),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
	formatting = cmp_format,
})

require("luasnip.loaders.from_vscode").lazy_load()
