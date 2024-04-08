local telescope = require("telescope")
local builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	extensions = {
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
			mappings = {
				["n"] = {
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd("startinsert")
					end,
					["<C-u>"] = function(prompt_bufnr)
						for i = 1, 10 do
							actions.move_selection_previous(prompt_bufnr)
						end
					end,
					["<C-d>"] = function(prompt_bufnr)
						for i = 1, 10 do
							actions.move_selection_next(prompt_bufnr)
						end
					end,
				},
			},
		},
	},
	defaults = {
		wrap_results = true,
		layout_strategy = "horizontal",
		layout_config = { prompt_position = "top" },
		sorting_strategy = "ascending",
		winblend = 0,
		mappings = {
			n = {},
		},
	},
	pickers = {
		diagnostics = {
			theme = "ivy",
			initial_mode = "normal",
			layout_config = {
				preview_cutoff = 9999,
			},
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files(telescope_themes.get_dropdown({}))
end)

vim.keymap.set("n", "<leader>fb", function()
	builtin.buffers(telescope_themes.get_ivy({}))
end)

vim.keymap.set("n", "<leader>fr", function()
	builtin.live_grep(telescope_themes.get_ivy({}))
end)

vim.keymap.set("n", "<leader>fc", function()
	builtin.find_files(telescope_themes.get_ivy({ cwd = vim.fn.stdpath("config") }))
end)

vim.keymap.set("n", "<leader>fd", function()
	builtin.diagnostics()
end)

vim.keymap.set("n", "<Leader>sf", function()
	local function telescope_buffer_dir()
		return vim.fn.expand("%:p:h")
	end

	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 30 },
	})
end)
