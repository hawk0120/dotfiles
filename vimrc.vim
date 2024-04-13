call plug#begin()

" coc for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

" Install zen-mode for minimalism
Plug 'folke/zen-mode.nvim'

" Install treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Install Markdown-Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }


" Install nvim-java
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap'

" Install prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }

" Install vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'
    
"Install vim-easy-align
Plug 'junegunn/vim-easy-align'

" Install Telescope
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.6'}
Plug 'nvim-lua/plenary.nvim'

" Install the gruvbox theme
Plug  'morhetz/gruvbox'
colorscheme gruvbox

" Install I use Neovim(BTW)
Plug 'letieu/btw.nvim'

Plug 'itchyny/lightline.vim'
let g:lightline = {
                                \ 'colorscheme' : 'gruvbox',
                                \ }


" netrw customizations
let g:netrw_banner=0
let g:netrw_localcopydircmd = 'cp -r'

syntax on               " Enable syntax highlighting
set noshowmode
set termguicolors       
set t_Co=256
set tabstop=2           " Number of spaces that a <Tab> in the file counts for
set relativenumber
set number

" for global replace: to use gR    
nnoremap gR gD:%s/<C-R>///gc<left><left><left>    

" for global replace: to use gR
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" Telescope remapped keys. 
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>

nnoremap <leader>w <cmd>write<cr>
nnoremap <leader>q <cmd>quit<cr>



call plug#end()

    

