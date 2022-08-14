augroup yaml
    au FileType yaml set tabstop=2
    au FileType yaml set shiftwidth=2
    au FileType yaml set expandtab
augroup END

"augroup C
"    "number of spaces in a tab
"    "number of spaces to use for >>
"    "replace tabs with spaces if want TAB do CTRL-V
"    au FileType c,cpp,java,perl,python,sh set tabstop=4
"    au FileType c,cpp,java,perl,python,sh set shiftwidth=4
"    au FileType c,cpp,java,perl,python,sh set expandtab
"augroup END
augroup C
    au FileType c set tabstop=4
    au FileType c set shiftwidth=4
    au FileType c set expandtab
augroup END
