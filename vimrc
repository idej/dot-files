" UTF-8 NWA style
scriptencoding utf-8

let mapleader = " "

" {{ plugins
" Set up vim-plug
call g:plug#begin('~/.config/nvim/plugins')

Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'croaker/mustang-vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'TagHighlight'
Plug 'jelera/vim-javascript-syntax', { 'for': 'js' }
Plug 'pangloss/vim-javascript', { 'for': 'js' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'less', 'sass', 'scss'] }
Plug 'JulesWang/css.vim', { 'for': ['css', 'less', 'sass', 'scss'] }
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'briancollins/vim-jst', { 'for': 'jst' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
Plug 'dsawardekar/ember.vim', { 'for': 'js' }
Plug 'gorodinskiy/vim-coloresque'
Plug 'heavenshell/vim-jsdoc', { 'for': 'js' }
Plug 'isRuslan/vim-es6', { 'for': 'js' }
Plug 'moll/vim-node', { 'for': 'js' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'rking/ag.vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeTabsToggle' } | Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'JazzCore/ctrlp-cmatcher' | Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'tpope/vim-rails', { 'for': 'rb' }
Plug 'elixir-lang/vim-elixir'
Plug 'mattn/emmet-vim'
Plug 'brendonrapp/smyck-vim'
Plug 'slim-template/vim-slim', { 'for': 'slim' }

call g:plug#end()
" }}

" {{ general configs
syntax on                                 " show syntax highlighting
filetype plugin on
filetype plugin indent on

set nobackup                " no backup and swap files
set history=1000

set undofile                    " Save undo's after file closes
set undodir=~/.config/nvim/undo         " where to save undo histories
set undolevels=1000             " How many undos
set undoreload=10000            " number of lines to save for undo
set noswapfile
set nowritebackup
set autoindent                  " indent on enter
set smartindent                 " do smart indenting when starting a new line
set shiftround                  " indent to the closest shiftwidth
set autoread                              " Automatically read reload file from disk if
set clipboard=unnamed                     " Default copy goes to system clipboard
set number                                " Show line number
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

" Use only 1 space after . when joining lines instead of 2
set nojoinspaces

" Don't reset cursor to start of line when moving around
set nostartofline

"show extra space characters
set list listchars=tab:▸\ ,trail:·,nbsp:_,extends:❯,precedes:❮

runtime macros/matchit.vim                " use % to jump between start/end of methods

" remove search highlighting
nnoremap <leader>h :noh<cr>

cnoreabbrev W w
cnoreabbrev Q q
" }}


" {{ airline configuration
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

" Required for CtrlSpace integration
let g:airline_exclude_preview = 1
" End CtrlSpace integration
" }}

set hidden

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
au BufEnter *.js syn match error contained "\<console.log\>"
au BufEnter *.js syn match error contained "\<debugger\>"

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_match_window_reversed = 0

let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" smart way to move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <C-h> <c-w>h
map <c-l> <c-w>l

" map Silver Searcher
map <leader>a :Ag!<space>

" search for word under cursor with Silver Searcher
map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"

" remove hash with rockets
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>

" Echo on arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

map <Leader>sp :set paste<CR>
map <Leader>snp :set nopaste<CR>

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|site-packages|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|pyc|debug\.js|simple\.js)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
let g:ctrlp_reuse_window = 'startify'

"let g:ctrlspace_project_root_markers = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS", "proj.sln"]

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style="sphinx"

map <C-N> :NERDTreeTabsToggle<CR>

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

colorscheme smyck "tomorrow-night-eighties
syntax enable

highlight ColorColumn ctermbg=233
autocmd! BufWritePost * Neomake

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

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
