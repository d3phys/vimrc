-------------------------------
-- Neovim lua/settings.lua
-------------------------------

-- General
vim.opt.colorcolumn 	= '80'
vim.opt.number      	= true

-- Tabs and spaces
vim.opt.tabstop 	= 8
vim.opt.softtabstop     = 8
vim.opt.expandtab	= true
vim.opt.smartindent	= true

-- Other
vim.opt.lazyredraw      = true
vim.opt.redrawtime 	= 10000  
vim.opt.synmaxcol	= 180     
vim.opt.re		= 1

-- Colorscheme
vim.cmd 'colorscheme github'
