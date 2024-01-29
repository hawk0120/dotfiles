call plug#begin()


" coc for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

" Install vim-easy-align
Plug 'junegunn/vim-easy-align'

" Install NERDTREE
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" Install the gruvbox theme
Plug  'morhetz/gruvbox'
colorscheme gruvbox

" Install LSP Client

Plug 'mfussenegger/nvim-jdtls'

syntax on               " Enable syntax highlighting
set termguicolors       " Enable true colors
set t_Co=256            " Required for the Ubuntu terminal



" Don't allow editing of read only files
autocmd BufRead * call RONoEdit()

function! RONoEdit()
  if &readonly == 1
    set nomodifiable
  else
    set modifiable
  endif
endfunction


