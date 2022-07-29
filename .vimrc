""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: .vimrc                                                         "
" Maintainer: Sandeep Pradhan                                                "
""        URL:                                                               "
"                                                                            "
"                                                                            "
"                                                                            "
" Sections:                                                                  "
"   01. General ................. General Vim behavior                       "
"   02. Plugins .................. General autocmd plugins                     "
"   03. Theme/Colors ............ Colors, fonts, etc.                        "
"   04. Vim UI .................. User interface behavior                    "
"   05. Text Formatting/Layout .. Text, tab, indentation related             "
"   06. Language Support ........ Any custom command aliases                 "
"   07. Plugin specific config                                               "
"
"
"
" Brief help
" :PlugInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PlugSearch foo - searches for foo; append `!` to refresh local cache
" :PlugClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""i


" plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
     "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
     let need_to_install_plugins = 1
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
let mapleader = ","      " change default leader key
set history=1000         " Increase command history limit
set splitbelow           " Create new horizontal windows below
set splitright           " Create new horizontal windows to the right

" mouse
set mouse=a
let g:is_mouse_enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Plugins                                                                 "
" Initiate pathogen before enabling filetype detection
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'kevinoid/vim-jsonc'                          " Vim syntax highlighting plugin for JSON with C-style line (//) and block (/* */) comments.
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/The-NERD-tree'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'                          " Rust syntax highlight
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go lang support
" Plug 'maralla/completor.vim'                       " Go autocompletion using gopls
Plug 'ctrlpvim/ctrlp.vim'                          " Jump between functions
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'                     " Vim status bar (Bottom)
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}    " Language server client
Plug 'cocopon/iceberg.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mkitt/tabline.vim'                           " Use it for buffer tab
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder script
Plug 'junegunn/fzf.vim' " Fuzzy finder vim pluging uses Fuzzy finder script
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set ofu=syntaxcomplete#Complete

" Enable spell check on commit message
autocmd BufNewFile,BufRead COMMIT_EDITMSG set spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSOR SETUP
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=5\x7"
let &t_EI = "\<Esc>]50;CursorShape=6\x7"

set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
"colorscheme iceberg       " set colorscheme
colorscheme jellybeans

" Prettify Markdown files
"augroup markdown
"   au!
"  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
"augroup END

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
  set colorcolumn=81
  highlight ColorColumn ctermbg=grey
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=10         " minimal number of lines before and after cursor
set number                " show line numbers
set relativenumber   " Higlight and zoom relative line number
set numberwidth=2         " make the number gutter 6 characters wide
set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
set showmatch
set visualbell
set backspace=2           " backspace over everything in insert mode
set encoding=UTF-8
set updatetime=100        " Update Bottom status line evry 100ms [Default 800ms]
set autowrite             " writes the content of the file automatically
                          " https://github.com/fatih/vim-go/wiki/Tutorial#quick-setup
let g:airline#extensions#tabline#enabled = 1 " Vim-airline smarter tab line

" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
set cursorcolumn
" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
" Set the commands to save in history default number is 20.
set history=1000


" Make search results appear on the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

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
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smartindent           " automatically insert one extra level of indentation
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set autoindent            " auto-indent
set undofile              " Maintain undo history between sessions
set undodir=~/.vim/undodir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Language support                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

"""""""""""""""""""""""""""""""Rust Setup""""""""""""""""""""""""""""""""""""
" https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave=1

""""""""""""""""""""""""""""""Go lang Setup"""""""""""""""""""""""""""""""""""
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" use these shortcuts to build and run a Go program with <leader>b and <leader>r
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" The ftplugin/go.vim file sets the custom completion of the vim-go plugin
setlocal omnifunc=go#complete#Complete

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Status line types/signatures.
let g:go_auto_type_info = 1

" Use new vim 7.2 popup windows for Go Doc
let g:go_doc_popup_window = 1
" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}

" Go syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_build_constraints = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Go Add Tags
let g:go_addtags_transform = 'camelcase'
noremap gat :GoAddTags<cr>

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" automatically show the information whenever you move your cursor.
let g:go_auto_type_info = 1
" automatically highlight matching identifiers.
let g:go_auto_sameids = 1
let g:go_def_mode = 'godef'
let g:go_decls_includes = "func,type"


"""""""""""""""""""""""""""""Python Setup"""""""""""""""""""""""""""""""""""""
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
" enable python-syntax module
let python_highlight_all = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 07. Plugin specifc config                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd tree used for file browse
let NERDTreeIgnore=['\.pyc$', '__pycache__']
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
:nnoremap <C-g> :NERDTreeToggle<CR>

" FZF fuzzy finder
" Finding for files
nnoremap <silent> <Leader><Space> :Files<CR>
" Finding inside files
nnoremap <silent> <Leader>f :Rg<CR>

" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" To enable the close button in the upper right corner of tab/buffer
hi TabLine      ctermfg=White  ctermbg=Black     cterm=NONE
hi TabLineFill  ctermfg=White  ctermbg=Black     cterm=NONE
hi TabLineSel   ctermfg=Black  ctermbg=Green     cterm=NONE
 "let g:tablineclosebutton=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
