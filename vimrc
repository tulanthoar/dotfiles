filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'FuzzyFinder'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
"Plugin 'powerline/powerline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'davidhalter/jedi-vim'
"Plugin 'deris/vim-gothrough-jk'
call vundle#end()
"set runtimepath^=/home/man/apps/dein/repos/github.com/Shougo/dein.vim
"call dein#begin(expand('/home/man/apps/dein'))
"call dein#add('Shougo/dein.vim')
"call dein#add('powerline/powerline')
"call dein#end()
filetype plugin indent on
colorscheme solarized
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:airline_theme='wombat'
let g:airline#extions#bufferline#enabled = 1
let g:airline#extions#syntastic#enabled = 1
"let g:airline#extions#tmuxline#color_template = 'normal'
"let g:airline#extions#tmuxline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:python3_host_prog = '/bin/python3'
let g:powerline_pycmd="py3"
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
set showcmd		" display incomplete commands
set showmatch
set showmode
set si
set smartcase
set so=7 "ensure 7 lines are above/below cursor when scrolling
set splitright
set timeoutlen=600
set ts=2 sw=2 et
set undofile		" keep an undo file (undo changes after closing)
set viminfo^=% " Remember info about open buffers on close
set whichwrap+=<,>,h,l
set wildignore=*.o,*~,*.pyc
set wildignorecase
set wrap

map Q gq
inoremap <C-U> <C-G>u<C-U>

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap         s <Plug>(easymotion-overwin-f2)
map  <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

map <space> /
map <c-space> ?
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map j gj
map k gk
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Remap VIM 0 to first non-blank character
map 0 ^
map ^ 0
" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" Quickly open a buffer for scripbble
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

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h%=L:C\ %l:%c
