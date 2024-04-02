call plug#begin()    
    
    
" coc for autocompletion    
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}    
    
" Install zen-mode for minimalism    
Plug 'folke/zen-mode.nvim'    
    
" Install nvim-java    
Plug 'mfussenegger/nvim-jdtls'    
Plug 'mfussenegger/nvim-dap'    
    
" Install prettier    
Plug 'prettier/vim-prettier', { 'do': 'npm install --frozen-lockfile --production' }    
    
    
" Install vim-tmux-navigator    
Plug 'christoomey/vim-tmux-navigator'    
    
" Install vim-easy-align    
Plug 'junegunn/vim-easy-align'    
    
" Install NERDTREE    
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Install the gruvbox theme    
Plug  'morhetz/gruvbox'    
colorscheme gruvbox    
    
    
syntax on               " Enable syntax highlighting    
set termguicolors       " Enable true colors    
set t_Co=256            " Required for the Ubuntu terminal    
set number        " Show line numbers    
set tabstop=2           " Number of spaces that a <Tab> in the file counts for    
    
    
" for global replace: to use gR    
nnoremap gR gD:%s/<C-R>///gc<left><left><left>    
    
    
call plug#end()    


" TODO: Change to Telescope   
" - Added vim-Test 
    

