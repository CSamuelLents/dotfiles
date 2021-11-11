syntax on                   " enable syntax highlighting
set cursorline              " highlight the current line
set nobackup                " don't create pointless backup files; Use VCS instead
set autoread                " watch for file changes
set showcmd                 " show selection metadata
set showmode                " show INSERT, VISUAL, etc. mode
set showmatch               " show matching brackets
set scrolloff=5             " show at least 5 lines above/below
filetype on                 " enable filetype detection
filetype indent on          " enable filetype-specific indenting
filetype plugin on          " enable filetype-specific plugins
" set background=dark       " darker color scheme
" set ruler                 " show line number in bar
" set number                " show line numbers
" colorscheme cobalt        " requires cobalt.vim to be in ~/.vim/colors

" column-width visual indication
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#001D2F

" tabs and indenting
set autoindent          " auto indenting
set smartindent         " smart indenting
set smarttab            " better backspace and tab functionality
set expandtab           " spaces instead of tabs
set tabstop=2           " 2 spaces for tabs
set shiftwidth=2        " 2 spaces for indentation

" bells
set noerrorbells        " turn off audio bell
set visualbell          " but leave on a visual bell

" search
set hlsearch            " highlighted search results
set showmatch           " show matching bracket

" other
set guioptions=aAace    " don't show scrollbar in MacVim
" call pathogen#infect()  " use pathogen

" clipboard
set clipboard=unnamed   " allow yy, etc. to interact with OS X clipboard

" shortcuts
map <F2> :NERDTreeToggle<CR>

" remapped keys
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" start NERDTree, and move the cursor to its window if a file is specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
