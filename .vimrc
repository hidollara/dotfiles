" Application Settings
syntax enable
set number
set ruler
set cmdheight=2
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set hlsearch
set list
set listchars=tab:>\ ,trail:-

" Default FileType Settings
set expandtab
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2

function! CodingFormat(tabwidth, isSofttab)
    let &tabstop = a:tabwidth
    let &shiftwidth = a:tabwidth
    let &softtabstop = a:tabwidth
    set noexpandtab
endfunction

augroup FileTypeIndent
    autocmd!
    autocmd BufRead,BufNewFile Makefile call CodingFormat(4, 1)
    autocmd BufRead,BufNewFile *.go call CodingFormat(4, 1)
augroup END

" Functions
set backspace=indent,eol,start
set incsearch
set wildmenu
set showcmd
set whichwrap=b,s,h,l,<,>,[,],~
