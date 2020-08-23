
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neovim (NVIM) Configuration File
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set secure
set showmatch           " Show matching brackets/parens/braces
set number              " Show line numbers
set formatoptions+=o    " Continue comment markers in new lines opened with `o`
                        "   or `O` (the open new line key) in command mode
set expandtab           " Spaces, not tabs
set tabstop=4           " 4 spaces per tab
set softtabstop=4       " 4 spaces per tab
set shiftwidth=4        " 4 spaces per tab (on \t)
set nojoinspaces        " Do not insert two spaces on joining lines
set splitbelow          " :sp splits below current
set splitright          " :vs splits right of current
set ignorecase          " Searching is case-insensitive
set smartcase           " ... unless the search query has capital letters
set gdefault            " use 'g' (global) flag for :%s/foo/bar/

filetype plugin indent on
set smarttab
set softtabstop
set autoread

set foldenable
set foldmethod=indent
noremap <space> za

""" Remove trailing whitespaces on save (carry over from VIM, unsure about
"   native NVIM syntax (if different)
"   autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

""" Source the vim-plug configuration file, but only if running in Neovim
fun! SourceIfExists(file)
    if filereadable(expand(a:file))
        exe 'source' a:file
    endif
endfun

if has('nvim')
    set mouse=a
    call SourceIfExists("~/.config/nvim/vimplug.vim")
endif

