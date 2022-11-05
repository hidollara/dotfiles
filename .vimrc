let s:dein_dir = $XDG_CACHE_HOME . '/dein'
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

if exists('$BASE16_THEME')
    \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
  let base16colorspace=256
  colorscheme base16-$BASE16_THEME
endif

let g:lightline.component.filestatus = '%f%<%m%r%h%w'
let g:lightline.component_function.gitbranch = 'FugitiveHead'
let g:lightline.component_function.cocstatus = 'coc#status'
let g:lightline.active.left = [ [ 'mode', 'paste' ], [ 'filestatus', 'gitbranch' ], [ 'cocstatus' ] ]

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | endif | NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

filetype plugin indent on
syntax enable

set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set encoding=utf-8
set expandtab
set hlsearch
set incsearch
set laststatus=2
set list
set listchars=tab:\ \ ,trail:-
set noshowmode
set number
set ruler
set shiftwidth=2
set showcmd
set signcolumn=yes
set smartindent
set softtabstop=2
set tabstop=2
set updatetime=250
let &viminfo = &viminfo . ',n' . $XDG_CACHE_HOME . '/.viminfo'
set whichwrap=b,s,h,l,<,>,[,],~
set wildmenu
