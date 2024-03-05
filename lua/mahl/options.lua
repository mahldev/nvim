local opt = vim.opt

opt.guicursor = ""
opt.nu = true
opt.rnu = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.isfname:append("@-@")

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_keepdir = 0
