local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim" .. install_path)
	vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "hrsh7th/cmp-path" },
		},
	})
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "stevearc/conform.nvim" })
	use("echasnovski/mini.comment")
	use({ "stevearc/dressing.nvim" })
	use({ "kdheepak/lazygit.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("echasnovski/mini.ai")
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	})
	use({ "rest-nvim/rest.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({
		"epwalsh/obsidian.nvim",
		tag = "*",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
end)
