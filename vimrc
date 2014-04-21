" set up bundler
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" custom plugins
Bundle 'Lokaltog/vim-powerline'
Bundle 'Rename2'
Bundle 'Sass'
Bundle 'Tabular'
Bundle 'epmatsw/ag.vim'
Bundle 'dsawardekar/ember.vim'
Bundle 'mattn/gist-vim'
Bundle 'othree/html5-syntax.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-abolish'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'endwise.vim'
Bundle 'tpope/vim-repeat'
Bundle 'vim-ruby/vim-ruby'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'slim-template/vim-slim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'croaker/mustang-vim'
Bundle 'csv.vim'
Bundle 'ctrlp.vim'
Bundle 'cucumber.zip'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'fugitive.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'less.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'splitjoin.vim'
Bundle 'surround.vim'
Bundle 'tpope/vim-rails'
Bundle 'unimpaired.vim'
Bundle 'vim-coffee-script'
Bundle 'snipMate'

" set color scheme
colorscheme mustang

syntax on                                 " show syntax highlighting
filetype plugin indent on

set nobackup                " no backup and swap files
set noswapfile
set nowritebackup
set autoindent
set autoread                              " Automatically read reload file from disk if
set clipboard=unnamed                     " Default copy goes to system clipboard
set relativenumber                        " Show relative line number
set cursorline                            " Hilight current line
set directory=$HOME/.vim/tmp//,.          " Keep swap files in one location
set expandtab                             " User spaces instead of tabs
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866 " Order of file encoding recognition attempts
set ffs=unix,dos,mac                      " Order of line endings recognition attempts
set foldlevel=20
set foldlevelstart=20
set foldmethod=syntax
set hlsearch                              " Highlight search results
set ignorecase                            " Ignore case when searching
set incsearch                             " Highlight search results while inputting
set laststatus=2                          " always show status bar
set list listchars=tab:»·,trail:·         " show extra space characters
set mat=5                                 " Match blinking
set matchtime=3
set noswapfile                            " Don't create swap FileWritePre
set scrolloff=5                           " Show 3 lines of context arount the cursor
set shiftwidth=2                          " Global shift width
set showmatch
set showmode                              " Display mode you're in
set smartcase                             " Case sensitive search if any uppercased character presents in the search
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
set ruler                 " Show cursor position all the time
set showcmd                 " Show incomplete commands

runtime macros/matchit.vim                " use % to jump between start/end of methods

" set leader key to comma
let mapleader = ","

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" unmap F1 help
nmap <F1> :echo<CR>
imap <F1> <C-o>:echo<CR>

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" delete trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

map <F8> :call TrimWhiteSpace()<cr>

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_us<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_us<cr>

" smart way to move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" map Silver Searcher
map <leader>a :Ag!<space>

" search for word under cursor with Silver Searcher
map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"

" remove hash with rockets
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>

map <C-N> :NERDTreeTabsToggle<CR>
map <Leader>n :NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 40
let g:nerdtree_tabs_autoclose=0
