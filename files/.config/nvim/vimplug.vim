""" Vim-Plug file

call plug#begin('~/.local/share/nvim/plug')

" Plug 'https://github.com/...'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }

Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'

call plug#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

if !has('gui_running')
    set t_Co=256
endif

""" TODO: FIX THIS

" let g:lightline = {
"     \ 'colorscheme' : 'one dark',
"     \ 'active' : {
"     \   'left'  : [ [ 'mode', 'paste'[,
"     \               [ 'readonly', 'filename', 'modified' ] ],
"     \   'right' : [ [ 'lineinfo' ],
"     \               [ 'percent' ],
"     \               [ 'charvaluehex', 'fileformat', 'fileencoding', 'filetype' ]]
"     \ },
"     \ 'component' : {
"     \   'charvaluehex' : '0x%B'
"     \ },
"     \ }
