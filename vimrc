filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-bufferline'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'vim-ctrlspace/vim-ctrlspace'
call vundle#end()
filetype plugin indent on
colorscheme solarized
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:deoplete#enable_at_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline#extions#bufferline#enabled = 1
let g:airline#extions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:python3_host_prog = '/bin/python3'
let g:powerline_pycmd="py3"
let NERDTreeIgnore=['\\.pyc', '\\\~$', '\\.swo$', '\\.swp$', '\\.git', '\\.hg', '\\.svn', '\\.bzr']
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
syntax enable

set autoread
set autochdir
set ai "auto indent
set background=light
set backup		" keep a backup file (restore to previous version)
set cmdheight=2
set cursorline
set cursorcolumn
set eol
set expandtab
set hidden
set ignorecase
set lbr
set lcs+=extends:&,precedes:&
set list
set magic
set mat=2
set mouse=a
set number
set nuw=2
set relativenumber
set ruler		" show the cursor position all the time
set scrolljump=5
set showcmd		" display incomplete commands
set showmatch
set showmode
set showtabline=0
set si
set smartcase
set so=5 "ensure 5 lines are above/below cursor when scrolling
set splitright
set timeoutlen=600
set ts=2 sw=2 et
set undofile		" keep an undo file (undo changes after closing)
set viminfo^=% " Remember info about open buffers on close
set whichwrap+=<,>,h,l
set wildignore=*.o,*~,*.pyc
set wildignorecase
set wildmenu
set wrap

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
map Q gq
inoremap <C-U> <C-G>u<C-U>
nnoremap Y y$

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap         <space> <Plug>(easymotion-overwin-f2)
map  <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <leader>e :NERDTreeFind<CR>
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

map <F6> "ky
map <S-F6> "kp
map <F5> "jy
map <S-F5> "jp
map <F4> ml
map <S-F4> 'l
map <F3> mk
map <S-F3> 'k
map <F2> mj
map <S-F2> 'j
map <Leader><space> /
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map j gj
map k gk
map <leader>cd :cd %:p:h<cr>:pwd<cr>
nmap 0 ^
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
map <leader>q :e ~/buffer<cr>
map <leader>w :w<cr>

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

