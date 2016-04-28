" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" Better command-line completion
set wildmenu

" Set powershell as my default shell
"set shell=powershell
"set shellcmdflag=-command

" Vundle Setup
filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

Plugin 'bkad/CamelCaseMotion'
Plugin 'closetag.vim'
Plugin 'vim-scripts/mru.vim'
Plugin 'scrooloose/NerdTree'
Plugin 'Rename.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jlfwong/vim-mercenary'
Plugin 'PProvost/vim-ps1'
Plugin 'kana/vim-smartinput'
Plugin 'vim-scripts/ZenCoding.vim'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'krisajenkins/vim-pipe'
Plugin 'bufmru.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'gcmt/wildfire.vim'
Plugin 'habamax/vim-skipit'
Plugin 'unblevable/quick-scope'

Plugin 'kana/vim-textobj-user'
Plugin 'Julian/vim-textobj-brace'
Plugin 'whatyouhide/vim-textobj-xmlattr'
Plugin 'glts/vim-textobj-comment'
Plugin 'kana/vim-textobj-function'
Plugin 'sgur/vim-textobj-parameter'
Plugin 'beloglazov/vim-textobj-punctuation'
Plugin 'beloglazov/vim-textobj-quotes'
Plugin 'saihoooooooo/vim-textobj-space'
Plugin 'Julian/vim-textobj-variable-segment'
Plugin 'jceb/vim-textobj-uri'

call vundle#end()
filetype plugin indent on


" Saving for later so I can split this into multiple files
"source $VIM\vim config\autocommands.vim       " The filename says it already

"source ~\config\quick-scope.vim

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=100
" show the cursor position all the time
set ruler
" display incomplete commands
set showcmd
" do incremental searching
set incsearch

set hlsearch

set visualbell

set guioptions=ce

" Ignore case on search, unless the search starts with a capital letter
set ignorecase
set smartcase

set number
set nowrap
set clipboard=unnamed

" Allow NERDTree to modify directories and files
set modifiable

set tabstop=4
set shiftwidth=4
set expandtab

" alway show status line, even when only one file is open
set laststatus=2
set statusline=%f\ Line:%l/%L\ Col:%c\ %m\

set showmode
set cursorline

set scrolloff=8

if has('gui_running')
    set background=dark
else
    set background=light
end

colorscheme solarized
let g:solarized_termtrans=1
let g:solarized_italic=0

let mapleader = " "
let maplocalleader = "\\"

" vim-bookmarks options
let g:bookmark_sign = '>'
let g:bookmark_annotation_sign = '<'
" Auto close the book mark split when jumping to a bookmark
let g:bookmark_auto_close = 1

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

syntax on
set lines=50 columns=200

" Enable file type detection.
filetype plugin indent on

com! W :w
com! Q :q
com! Wq :wq
com! WQ :wq

" Map <leader>d to show the current directory and <leader>D to show the
" current directory in a new tab
nnoremap <leader>d :e %:h<CR>
nnoremap <leader>D :tabe %:h<CR>

nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

" Map <leader>/ to turn off the last highlight
nnoremap <leader>/ :nohlsearch<cr>

" Map <leader>w to toggle wrapping
nnoremap <leader>w :set wrap!<cr>

" Map <leader>ya to copy the whole file
nnoremap <leader>ya ggVGy

" Map Ctrl-t to new tab, like a browser does
nnoremap <c-t> :tabe<CR>

" Map Ctrl-d to delete the current line in both insert and normal mode
nnoremap <c-d> dd
inoremap <c-d> <esc>ddi

" Map pp to paste in insert mode from the default register
inoremap pp <C-r>0

" Map Ctrl-s to save a file in normal and insert mode
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a

" Map Ctrl with j, k, l, and h to switch between splits.
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Map Alt with j, k, l and h to resize the splits.
noremap <a-j> <c-w>-
noremap <a-k> <c-w>+
noremap <a-l> <c-w><
noremap <a-h> <c-w>>

" Map Shift j and k to switch tabs
nnoremap <s-j> gt
nnoremap <s-k> gT

"Map autocomplete to tab
inoremap <tab> <c-n>

" map H and L to go to start and end of line
nnoremap H ^
nnoremap L $

"Make Y to work like C or D
nnoremap Y y$

" Map ; to : since it's easier to type
nnoremap ; :

"Map <leader>; to ; so I still have the functionality of ; if I need it
nnoremap <leader>; ;

"Mapping <leader>nt to launch nerd tree
nnoremap <leader>nt :NERDTreeToggle<cr>
"Mapping <leader>t to focus NERDTree
nnoremap <leader>t <C-W><C-W>

"Mapping <leader>cdw to change to current working directory
nnoremap <leader>cdw :cd %:p:h<cr>

"Mapping <leader>cp to copy the current file name and path to the default clipboard
nnoremap <leader>cp :let @* = expand("%:p")<cr>

" insert blank lines without going into insert mode
nnoremap go o<esc>
nnoremap gO O<esc>

" make tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"  jk exits insert mode
inoremap jk <esc>

" Mak [b and ]b to next and previous buffers
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" CTRL-U in insert mode deletes a lot. Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e
map i<S-W> <Plug>CamelCaseMotion_iw
map i<S-B> <Plug>CamelCaseMotion_ib
map i<S-E> <Plug>CamelCaseMotion_ie

"Common abbreviations / replacements
iabbrev teh the
iabbrev adn and
iabbrev waht what

"Local file type changes
augroup filetype_cs
    autocmd!
    autocmd FileType cs nnoremap <buffer> <localleader>c I//<esc>
augroup END

augroup filetype_js
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//
augroup END

augroup filetype_ps1
    autocmd!
    autocmd FileType ps1 nnoremap <buffer> <localleader>c I#
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>c I#<esc>
augroup END
