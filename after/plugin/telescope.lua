local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files(require("telescope.themes").get_dropdown({}))
end)

vim.keymap.set("n", "<leader>fb", function()
	builtin.buffers(require("telescope.themes").get_ivy({}))
end)

vim.keymap.set("n", "<leader>fr", function()
	builtin.live_grep(require("telescope.themes").get_ivy({}))
end)

vim.keymap.set("n", "<leader>fc", function()
	builtin.find_files(require("telescope.themes").get_ivy({ cwd = vim.fn.stdpath("config") }))
end)

vim.keymap.set("n", "<leader>fd", function()
	builtin.diagnostics({
		layout_strategy = "vertical",
		initial_mode = "normal",
	})
end)
