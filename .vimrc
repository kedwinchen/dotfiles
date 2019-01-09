set secure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500



" Add a bit extra margin to the left
" set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set t_Co=256
set background=dark
colorscheme default

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"#set noexpandtab
"#set expandtab

" 1 tab == 4 spaces
"#set shiftwidth=4
"#set tabstop=4

" Linebreak on 500 characters
"#set lbr
"#set tw=500

"#set autoindent "Auto indent
"#set si "Smart indent
"#set wrap "Wrap lines
"#set smarttab

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

filetype plugin indent on

set number

" FOR CPE 357
"augroup C
"    "number of spaces in a tab
"    "number of spaces to use for >>
"    "replace tabs with spaces if want TAB do CTRL-V
"    au FileType c,cpp,java,perl,python,sh set tabstop=4
"    au FileType c,cpp,java,perl,python,sh set shiftwidth=4
"    au FileType c,cpp,java,perl,python,sh set expandtab
"augroup END
augroup C
    au FileType c set tabstop=8
    au FileType c set shiftwidth=8
    au FileType c set expandtab
augroup END
