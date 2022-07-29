""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
let mapleader = ","      " change default leader key
:set splitbelow           " Create new horizontal windows below
:set splitright           " Create new horizontal windows to the right

" mouse
:set mouse=a
let g:is_mouse_enabled = 1

:set tabstop=4             " tab spacing
:set softtabstop=4         " unify
:set shiftwidth=4          " indent/outdent by 2 columns
:set shiftround            " always indent/outdent to the nearest tabstop
:set expandtab             " use spaces instead of tabs
:set smartindent           " automatically insert one extra level of indentation
:set smarttab              " use tabs at the start of a line, spaces elsewhere
:set nowrap                " don't wrap text
:set autoindent            " auto-indent
:set undofile              " Maintain undo history between sessions
:set undodir=~/.vim/undodir


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set scrolloff=10         " minimal number of lines before and after cursor
:set number                " show line numbers
:set relativenumber    " Higlight and zoom relative line number
:set numberwidth=2         " make the number gutter 6 characters wide
:set cul                   " highlight current line
:set laststatus=2          " last window always has a statusline
:set nohlsearch            " Don't continue to highlight searched phrases.
:set incsearch             " But do highlight as you type your search.
:set ruler                 " Always show info along bottom.
:set showmatch
:set visualbell
:set backspace=2           " backspace over everything in insert mode
:set encoding=UTF-8
:set updatetime=100        " Update Bottom status line evry 100ms [Default 800ms]
:set autowrite             " writes the content of the file automatically
                          " https://github.com/fatih/vim-go/wiki/Tutorial#quick-setup
let g:airline#extensions#tabline#enabled = 1 " Vim-airline smarter tab line

" Highlight cursor line underneath the cursor horizontally.
:set cursorline
" Highlight cursor line underneath the cursor vertically.
:set cursorcolumn
" While searching though a file incrementally highlight matching characters as you type.
:set incsearch
" Ignore capital letters during search.
:set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
:set smartcase
" Show partial command you type in the last line of the screen.
:set showcmd
" Show the mode you are on the last line.
:set showmode
" Show matching words during a search.
:set showmatch
" Use highlighting when doing a search.
:set hlsearch
" Set the commands to save in history default number is 20.
:set history=1000

" move through split windows
nmap <leader><Up> :wincmd k<CR>
nmap <leader><Down> :wincmd j<CR>
nmap <leader><Left> :wincmd h<CR>
nmap <leader><Right> :wincmd l<CR>

nmap <leader>h :tabprevious<CR>
nmap <leader>l :tabprevious<CR>

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Install                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/fatih/vim-go', { 'do': ':GoInstallBinaries' } " Make vim a first class Go development environment
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder script
Plug 'junegunn/fzf.vim' " Fuzzy finder vim pluging uses Fuzzy finder script

set encoding=UTF-8

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 07. Plugin specifc config                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"--------------------------Nerd tree used for file browse--------------------------"
let NERDTreeIgnore=['\.pyc$', '__pycache__']
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-g> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

"--------------------------------FZF fuzzy finder--------------------------------"
" Finding for files
nnoremap <silent> <Leader><Space> :Files<CR>
" Finding inside files
nnoremap <silent> <Leader>f :Rg<CR>

let g:coc_global_extensions = [
    \'coc-json', 'coc-git','coc-go', 'coc-pyright',
    \'coc-rust-analyzer', 'coc-yaml', 'coc-docker', 'coc-sh'
    \]


nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans


" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific config                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
