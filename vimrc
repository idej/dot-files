let mapleader = " "

" set up bundler
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

" custom plugins
Plugin 'Lokaltog/vim-powerline'
Plugin 'SirVer/ultisnips'
Plugin 'int3/vim-extradite'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-speeddating'
" Plugin 'tpope/vim-rsi'
Plugin 'stefanoverna/vim-i18n'
Plugin 'kien/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'junegunn/vim-easy-align'
Plugin 'wellle/targets.vim'
Plugin 'slim-template/vim-slim'
Plugin 'jgdavey/vim-blockle.git'
Plugin 'vim-scripts/closetag.vim'
Plugin 'tommcdo/vim-exchange'
Plugin 'AndrewRadev/switch.vim'
Plugin 'gregsexton/gitv'
Plugin 'gabrielelana/vim-markdown'
Plugin 'skwp/greplace.vim'
Plugin 'avakhov/vim-yaml'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'godlygeek/tabular'
Plugin 'Sass'
Plugin 'epmatsw/ag.vim'
Plugin 'dsawardekar/ember.vim'
Plugin 'mattn/gist-vim'
Plugin 'othree/html5-syntax.vim'
Plugin 'tpope/vim-repeat'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'croaker/mustang-vim'
Plugin 'csv.vim'
Plugin 'cucumber.zip'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'
Plugin 'splitjoin.vim'
Plugin 'surround.vim'
Plugin 'unimpaired.vim'

Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/SyntaxAttr.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-bundler'
Plugin 'duggiefresh/vim-easydir'
Plugin 'tpope/vim-endwise'
Plugin 'digitaltoad/vim-jade'
Plugin 'briancollins/vim-jst'
Plugin 'groenewege/vim-less'
Plugin 'idanarye/vim-merginal'
Plugin 'vim-ruby/vim-ruby'
Plugin 'honza/vim-snippets'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'matthewsimo/angular-vim-snippets'
Plugin 'mattn/emmet-vim'
" Plugin 'vim-spec-runner'
" Plugin 'vim-tmux-runner'

call vundle#end()

" set color scheme
colorscheme mustang

syntax on                                 " show syntax highlighting
filetype plugin on
filetype plugin indent on

set nobackup                " no backup and swap files
set history = 100

set undofile                    " Save undo's after file closes
set undodir=~/.vim/undo         " where to save undo histories
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

set backspace=eol,start,indent

runtime macros/matchit.vim                " use % to jump between start/end of methods

"" Autocomplete ids and classes in CSS
autocmd FileType css,scss,less set iskeyword=@,48-57,_,-,?,!,192-255

" remove search highlighting
nnoremap <leader>h :noh<cr>

cnoreabbrev W w
cnoreabbrev Q q

" Limit commit message width and check spelling
autocmd Filetype gitcommit setlocal spell textwidth=72

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"
au BufEnter *.js syn match error contained "\<console.log\>"
au BufEnter *.js syn match error contained "\<debugger\>"

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_match_window_reversed = 0

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

let g:ctrlp_funky_syntax_highlight = 1

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

" Echo on arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" map git commands
map <leader>b :Gblame<cr>
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

map <Leader>sp :set paste<CR>
map <Leader>snp :set nopaste<CR>

" rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <F2> :call RenameFile()<cr>

map <C-N> :NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 40
let g:nerdtree_tabs_autoclose=0

" CtrlP Delete
call ctrlp_bdelete#init()

" CtrlP Funky
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_multi_buffers = 1
"
" CtrlP
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git\|node_modules\|bin\|\.hg\|\.svn\|build\|log\|resources\|coverage\|doc\|tmp\|public/assets\|vendor\|Android\|ios',
      \ 'file': '\.jpg$\|\.exe$\|\.so$\|tags$\|\.dll$'
      \ }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']

" let g:syntastic_ruby_checkers=['rubocop']
" hamlc syntax highlighting
au BufRead,BufNewFile *.hamlc set ft=haml

let g:user_emmet_mode='n'
let g:user_emmet_install_global = 0
autocmd FileType html,css,less,scss EmmetInstall

