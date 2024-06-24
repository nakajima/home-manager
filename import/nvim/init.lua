require("config.lazy")

-- Basic setup options
vim.opt.termguicolors = true
vim.cmd([[
	set autoindent
	set noexpandtab
	set tabstop=2
	set shiftwidth=2
]])

vim.cmd("map <S-Esc> :NvimTreeFocus <CR>")
