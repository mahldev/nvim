vim.g.mapleader = " "

local mappings = {
	{ "n", "y", '"+y' },
	{ "v", "y", '"+y' },
	{ "n", "p", '"+p' },
	{ "v", "p", '"+p' },
	{ "n", "d", '"+d' },
	{ "v", "d", '"+d' },
	{ "n", "<leader>sf", vim.cmd.Ex },
}

for _, map in ipairs(mappings) do
	vim.keymap.set(map[1], map[2], map[3], { noremap = true })
end
