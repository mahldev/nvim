vim.g.mapleader = " "

local mappings = {
	{ "n", "<leader>sf", ":Neotree filesystem toggle  right<CR>" },
	{ "n", "<leader>gg", vim.cmd.LazyGit },
	{ "n", "<leader>m", vim.cmd.Mason },
	{ "n", "<leader>rr", "<Plug>RestNvim" },
	{ "n", "<leader>fo", vim.cmd.ObsidianSearch },
}

for _, map in ipairs(mappings) do
	vim.keymap.set(map[1], map[2], map[3], { silent = true, noremap = true })
end
