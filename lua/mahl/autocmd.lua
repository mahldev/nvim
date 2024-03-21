local packer_setup_path = vim.fn.stdpath("config") .. "/lua/mahl/packer.lua"

vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("Packer", { clear = true }),
	pattern = packer_setup_path,
	callback = function()
		vim.cmd("so | PackerSync")
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	command = "setlocal expandtab shiftwidth=2 softtabstop=2",
})
