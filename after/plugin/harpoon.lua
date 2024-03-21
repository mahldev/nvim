local harpoon = require("harpoon")
local set = vim.keymap.set

harpoon:setup({
	settings = {
		save_on_toggle = true,
	},
})

set("n", "<leader>a", function()
	harpoon:list():append()
end)
set("n", "<leader>ee", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
set("n", "<leader>ej", function()
	harpoon:list():select(1)
end)
set("n", "<leader>ek", function()
	harpoon:list():select(2)
end)
set("n", "<leader>el", function()
	harpoon:list():select(3)
end)
set("n", "<leader>e;", function()
	harpoon:list():select(4)
end)
