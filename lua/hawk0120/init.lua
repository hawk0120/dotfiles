vim.cmd("set noshowmode")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("syntax on")
vim.cmd(" let g:netrw_banner=0")
vim.opt.mouse = ""
colorscheme = "tokyonight"
vim.opt.termguicolors = true

require("hawk0120.remap")
require("hawk0120.plugins")
require'nvim-treesitter.configs'.setup{highlight={enable=true}}  
