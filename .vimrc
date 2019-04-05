let s:dein_dir = $HOME . '/.cache/dein'
let s:dein_body = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_body)
    silent execute '!git clone https://github.com/Shougo/dein.vim' s:dein_body
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_body, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml($HOME . '/.dein.toml', {'lazy': 0})
  call dein#load_toml($HOME . '/.dein.lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  silent call dein#install()
endif

filetype plugin indent on
syntax enable

set autoindent
set autoread
set backspace=indent,eol,start
set expandtab
set hlsearch
set incsearch
set laststatus=2
set list
set listchars=tab:>\ ,trail:-
set number
set shiftwidth=2
set showcmd
set smartindent
set softtabstop=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set tabstop=2
set updatetime=250
set ruler
set whichwrap=b,s,h,l,<,>,[,],~
set wildmenu
