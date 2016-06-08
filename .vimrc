" Change the leader from \ to ,
let mapleader = ","

if $KBD_LAYOUT == 'colemak'
  noremap n j|noremap <C-w>n <C-w>j
  noremap e k|noremap <C-w>e <C-w>k
  noremap N J|noremap <C-w>N <C-w>J
  noremap s h|noremap <C-w>s <C-w>h
  noremap S H|noremap <C-w>S <C-w>H
  noremap t l|noremap <C-w>t <C-w>l
  noremap T L|noremap <C-w>T <C-w>L

  noremap h s|noremap <C-w>h <C-w>s
  noremap f e|noremap <C-w>f <C-w>e
  noremap F E|noremap <C-w>F <C-w>E
  noremap k n|noremap <C-w>k <C-w>n
  noremap K N|noremap <C-w>K <C-w>N

  noremap j f|noremap <C-w>j <C-w>f
  noremap J F|noremap <C-w>J <C-w>F
  noremap l t|noremap <C-w>l <C-w>t
  noremap L T|noremap <C-w>L <C-w>T

  "L & H is remaped to S & T so unmap L & H
  nnoremap L <Nop>
  nnoremap H <Nop>

  "Remap ctrl-n to be save. :w<cr> is not helping my rsi!
  nnoremap <C-n> :w<cr>
endif

" swap characters. Works like ctl-t in zsh.
nmap <C-p> Xp

" Position the cursor at the beginning of the redo
nmap . .`[

" Set up NeoBundle
let $BUNDLE_PATH=expand("$HOME/.vim/bundle/neobundle")
set runtimepath+=$BUNDLE_PATH

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\   'linux' : 'make -f make_unix.mak'
\   }
\ }

NeoBundle 'Kris2k/matchit'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-repeat'

NeoBundle 'cespare/vim-toml'
NeoBundle 'mbbill/undotree'

call neobundle#end()

" Prompt for uninstalled bundles found at startup
NeoBundleCheck

nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<cr>
nnoremap <leader>w :set nowrap!<cr>
nnoremap <leader>r :set filetype=ruby<cr>

syntax enable
syntax sync fromstart

filetype on
filetype plugin on
filetype indent on

autocmd FileType ruby,zsh set list
autocmd FileType ruby,zsh set listchars=trail:.,extends:#,nbsp:.

let g:solarized_termcolors=256
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_termtrans=1

syntax enable
set background=dark
colorscheme solarized

runtime macros/matchit.vim

:nohlsearch

let loaded_matchparen = 1

if $USER == 'root'
  set nomodeline
else
  set modeline
endif


" default options
set formatoptions=tcq

" default comment symbol
set commentstring=#\ %s

set viminfo^=!
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)

set autoindent

" Visual
set novisualbell  " No blinking .
set noerrorbells  " No noise.

set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set nonumber

set directory=~/.vim/tmp

" persistent undo.
if v:version >= 703
  set undofile
  set undodir=~/.vim/tmp
endif
