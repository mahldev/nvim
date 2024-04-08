vim.g.mapleader = " "

local mappings = {
	{ "n", "<leader>gg", vim.cmd.LazyGit },
	{ "n", "<leader>m", vim.cmd.Mason },
	{ "n", "<leader>rr", "<Plug>RestNvim" },
	{ "n", "<leader>fo", vim.cmd.ObsidianSearch },
	{ "n", "<C-d>", "<C-d>zz" },
	{ "n", "<C-u>", "<C-u>zz" },
	{ "n", "n", "nzzzv" },
	{ "n", "N", "Nzzzv" },
	{ "n", "J", "mzJ`z" },
	{ "v", "K", ":m '<-2<CR>gv=gv" },
	{ "v", "J", ":m '>+1<CR>gv=gv" },
	{ "n", "<leader>z", vim.cmd.ZenMode },
}

for _, map in ipairs(mappings) do
	vim.keymap.set(map[1], map[2], map[3], { silent = true, noremap = true })
end
