""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[VUNDLE SETTINGS]

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[CUSTOM PLUGINS]

" My plugins:
Bundle 'Lokaltog/vim-powerline'
Bundle 'Rename2'
Bundle 'Sass'
Bundle 'Tabular'
Bundle 'ack.vim'
Bundle 'slim-template/vim-slim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'croaker/mustang-vim'
Bundle 'csv.vim'
Bundle 'ctrlp.vim'
Bundle 'cucumber.zip'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'endwise.vim'
Bundle 'fugitive.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'less.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'splitjoin.vim'
Bundle 'surround.vim'
Bundle 'tComment'
Bundle 'tpope/vim-rails'
Bundle 'unimpaired.vim'
Bundle 'vim-coffee-script'
Bundle 'snipMate'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[COLORSCHEME]

"set dark background and color scheme
colorscheme mustang

" Ignore backspace and delete keys
:inoremap <BS> <Nop>
:inoremap <Del> <Nop>

" Don't make a backup before overwriting a file
set nobackup
set nowritebackup

" Show cursor position all the time
set ruler

" Show incomplete commands
set showcmd

" Don't use Ex mode, use Q for formatting
map Q gq

" Maps autocomplete to tab
imap <Tab> <C-N>

" Echo on arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

"" HISTORY
set history=50                           " Commands amount kept in the history list
set undodir=~/.vim/undodir
set undofile
set undolevels=50
set undoreload=50


syntax on                         		  " show syntax highlighting
filetype plugin indent on

"" OTHER
set ai                                    " Autoindent new lines
set autoread                              " Automatically read reload file from disk if it was changed from outside the vim and has no unsaved changes
set backspace=indent,eol,start            " Intuitive backspacing
set clipboard=unnamed                     " Default copy goes to system clipboard
set directory=$HOME/.vim/tmp//,.          " Keep swap files in one location
set expandtab                             " User spaces instead of tabs
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866 " Order of file encoding recognition attempts
set ffs=unix,dos,mac                      " Order of line endings recognition attempts
set foldlevel=20
set foldlevelstart=20
set foldmethod=syntax                     " Set block-to-fold determination method set hidden
set hls                                   " Highlight search results
set ignorecase                            " Ignore case when searching
set incsearch                             " Highlight search results while inputting
set laststatus=2                          " Show usefull status information at the bottom of the screen
set list
set listchars=tab:!-,trail:-,extends:>    " Show tab as dots and trailing spaces as -
set mat=5                                 " Match blinking
set matchtime=3
set noswapfile                            " Don't create swap FileWritePre
set number                                " Set line numbers
set scrolloff=5                           " Show 3 lines of context arount the cursor
set shiftwidth=2                          " Global shift width
set showmatch
set showmode                              " Display mode you're in
set smartcase                             " Case sensitive search if any uppercased character presents in the search phrase
set sts=2                                 " Amount of spaces per tab
set t_Co=256                              " Set color depth
set tabstop=2                             " Global tab width
set timeoutlen=500                        " Autoindent new lines
set title                                 " Set the terminal's title
set visualbell                            " No beeping
set wildignore+=*/.git/*,*/tmp/*,*/log/*,*/app/assets/images/*,*/vendor/assets/images/*,*/coverage/*,*/public/* " Files ignored from ctrlp search
set wildmenu                              " Enhanced command line completion
set wildmode=list:longest                 " Complete files like a shell
set wrap                                  " Turn on line wrapping

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[CONDITIONAL FLAGS]

if !has('gui_running')
  set mouse=
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[LET]

let mapleader = " "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[AUTO COMMANDS]

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

" Only for GUI version
autocmd FocusLost * :wa
autocmd FocusLost * silent! wa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[MAPPINGS]

vmap <Tab> >gv
vmap <S-Tab> <gv

inoremap kj <Esc>l

" Fast saving, reload, quit
nmap <leader>w :w!<cr>
nmap <leader>e :e!<cr>
nmap <leader>q :q!<cr>

" smart way to move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac. j is <A-j>.
" Some troubles with terminal.
nnoremap j ddp
nnoremap k ddkP
vmap j <Esc>`>jdd`<Pgv
vmap k <Esc>`<kdd`>pgv

" Convert all ruby hashes from 1.8 to 1.9 syntax
nnoremap cah :%s/:\([^ ]*\)\(\s*\)=>/\1:/g

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""[LOAD PLUGIN SPECIFIC SETTINGS]

for f in split(glob('~/.vim/settings/*.vim'), '\n')
  exe 'source' f
endfor

map <C-N> :NERDTreeTabsToggle<CR>
map <Leader>n :NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 40
let g:nerdtree_tabs_autoclose=0