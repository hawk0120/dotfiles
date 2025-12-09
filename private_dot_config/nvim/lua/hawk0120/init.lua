vim.cmd("set noshowmode")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("syntax on")
vim.cmd(" let g:netrw_banner=0")

-- Disable swap and backup files
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

vim.opt.mouse = ""
colorscheme = "onedark"
vim.opt.termguicolors = true

require("hawk0120.remap")
require("hawk0120.plugins")

require'nvim-treesitter.configs'.setup{highlight={enable=true}}  
require("onedark").load()

