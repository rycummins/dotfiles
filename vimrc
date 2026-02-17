" === General ===
set nocompatible              " Use Vim defaults (not Vi)
set encoding=utf-8            " UTF-8 encoding
set history=1000              " Command history
set undofile                  " Persistent undo across sessions
set undodir=~/.vim/undodir    " Undo file location
set noswapfile                " No swap files
set nobackup                  " No backup files
set autoread                  " Reload files changed outside vim
set hidden                    " Allow switching buffers without saving
set mouse=a                   " Enable mouse support
set clipboard=unnamed         " Use system clipboard (macOS)
set updatetime=300            " Faster completion/diagnostics

" === Appearance ===
syntax on                     " Syntax highlighting
set number                    " Line numbers
" set relativenumber            " Relative line numbers (uncomment to enable)
set cursorline                " Highlight current line
set showmatch                 " Highlight matching brackets
set termguicolors             " True color support
set background=dark           " Dark background
set signcolumn=yes            " Always show sign column (git, diagnostics)
" set colorcolumn=80,120        " Column markers (uncomment to enable)
set scrolloff=8               " Keep 8 lines visible above/below cursor
set sidescrolloff=8           " Keep 8 columns visible left/right
set laststatus=2              " Always show status line
set showcmd                   " Show partial commands
set noshowmode                " Hide mode (shown in statusline instead)
set title                     " Set terminal title
set list                      " Show invisible characters
set listchars=tab:»·,trail:·,nbsp:␣  " Display tabs and trailing spaces

" === Status Line (no plugin needed) ===
set statusline=
set statusline+=\ %{toupper(mode())}  " Current mode
set statusline+=\ \|\ %f              " File path
set statusline+=%m%r                   " Modified/readonly flags
set statusline+=%=                     " Right-align from here
set statusline+=\ %Y                  " File type
set statusline+=\ \|\ %l:%c           " Line:column
set statusline+=\ \|\ %p%%\           " Percentage through file

" === Search ===
set incsearch                 " Search as you type
set hlsearch                  " Highlight search results
set ignorecase                " Case-insensitive search...
set smartcase                 " ...unless uppercase is used

" === Indentation ===
set autoindent                " Copy indent from current line
set smartindent               " Smart auto-indenting
set expandtab                 " Spaces instead of tabs
set tabstop=4                 " Tab width
set shiftwidth=4              " Indent width
set softtabstop=4             " Backspace through spaces
filetype plugin indent on     " File-type specific indentation

" === Completion ===
set wildmenu                  " Visual autocomplete for commands
set wildmode=longest:full,full
set completeopt=menuone,noinsert,noselect
set shortmess+=c              " Suppress completion messages

" === Splits ===
set splitbelow                " Horizontal splits go below
set splitright                " Vertical splits go right

" === Key Mappings ===
let mapleader = " "           " Space as leader key

" Quick save/quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Clear search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits with arrows
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Move lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursor centered when scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap k kzzzv

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Quick access to file explorer
nnoremap <leader>e :Explore<CR>

" Yank to end of line (consistent with D and C)
nnoremap Y y$

" Don't lose selection when indenting
vnoremap < <gv
vnoremap > >gv

" === Filetype-specific ===
autocmd FileType javascript,typescript,json,yaml,html,css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab

" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Return to last edit position when opening files
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" === Color Scheme (built-in) ===
let g:catppuccin_flavour = 'mocha'
silent! colorscheme catppuccin_mocha
