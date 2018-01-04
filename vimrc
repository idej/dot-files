" UTF-8 NWA style
scriptencoding utf-8

let mapleader = " "

if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.config/nvim/plugins/'))
  call dein#begin(expand('~/.config/nvim/plugins/'))

  call dein#add(expand('~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim'))
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('brendonrapp/smyck-vim')
  call dein#add('benekastah/neomake')
  call dein#add('bling/vim-airline')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-endwise')
  call dein#add('rking/ag.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('kendling/taghighlight')
  call dein#add('Chiel92/vim-autoformat')
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('JazzCore/ctrlp-cmatcher', {'build': './install.sh'} )
  call dein#add('jasoncodes/ctrlp-modified.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scrooloose/nerdcommenter')

  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')

  call dein#add('jelera/vim-javascript-syntax', { 'on_ft': ['javascript'] })
  call dein#add('pangloss/vim-javascript', { 'on_ft': ['javascript'] })
  call dein#add('isRuslan/vim-es6', { 'on_ft': ['javascript'] })
  call dein#add('moll/vim-node', { 'on_ft': ['javascript'] })
  call dein#add('tpope/vim-rails', { 'on_ft': ['ruby'] })
  call dein#add('hail2u/vim-css3-syntax', { 'on_ft': ['css', 'less', 'sass', 'scss', 'html'] })
  call dein#add('JulesWang/css.vim', { 'on_ft': ['css', 'less', 'sass', 'scss', 'html'] })
  call dein#add('gorodinskiy/vim-coloresque', { 'on_ft': ['css', 'less', 'sass', 'scss', 'html'] })
  call dein#add('slim-template/vim-slim', { 'on_ft': ['html', 'slim'] })
  call dein#add('elzr/vim-json', { 'on_ft': ['json'] })
  call dein#add('plasticboy/vim-markdown', { 'on_ft': ['md'] })
  call dein#add('rust-lang/rust.vim', { 'on_ft': ['rust'] })

  call dein#add('mattn/emmet-vim', { 'on_ft': ['html', 'slim', 'haml', 'css'] })

  call dein#end()
  call dein#save_state()
endif

" {{ general configs
syntax on                                 " show syntax highlighting

filetype plugin on
filetype plugin indent on

set nobackup                " no backup and swap files
set history=1000

set undofile                             " Save undo's after file closes
set undodir=~/.config/nvim/undo          " where to save undo histories
set undolevels=1000                      " How many undos
set undoreload=10000                     " number of lines to save for undo
set noswapfile
set nowritebackup
set autoindent                            " indent on enter
set smartindent                           " do smart indenting when starting a new line
set shiftround                            " indent to the closest shiftwidth
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
set ruler                                 " Show cursor position all the time
set showcmd                               " Show incomplete commands
set hidden

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

colorscheme smyck
syntax enable

" }}

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=233
endif

" Silver Searcher
map <leader>a :Ag!<space>
map <leader>A :Ag! "<C-r>=expand('<cword>')<CR>"

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn)|site-packages|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|pyc|debug\.js|simple\.js)$',
    \ }
let g:ctrlp_reuse_window = 'startify'

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"

" ctrlp modifier
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>

" remove hash with rockets
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr>

" paste/no paste mode
map <Leader>sp :set paste<CR>
map <Leader>snp :set nopaste<CR>

" Echo on arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" smart way to move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <C-h> <c-w>h
map <c-l> <c-w>l

" NerdTtee
map <C-N> :NERDTreeTabsToggle<CR>

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" airline configuration
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_exclude_preview = 1

" Neomake
"autocmd BufReadPost,BufWritePost * Neomake
"let g:neomake_airline = 0

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" UltiSnips
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style="sphinx"

" indent guide
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,slim,haml EmmetInstall

" format JSON using python json tool
com! FormatJSON %!python -m json.tool

" python support
let g:python2_host_prog = '/usr/local/bin/python'
" let g:python3_host_prog = '/usr/local/bin/python3'
