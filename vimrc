colorscheme Tomorrow-Night-Bright

runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax enable

set backupdir=~/.vim/backup/
set directory=~/.vim/swap/

set autoindent
set colorcolumn=+1
set cursorline
set formatoptions-=t
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set modeline
set number
set shiftwidth=2
set smartcase
set smarttab
set t_Co=256
set tabstop=2
set textwidth=80
set wildmenu

highlight LineNr ctermfg=green

command C let @/=""
command W w !sudo tee % > /dev/null

nmap <F8> :TagbarToggle<CR>

au FileType *py,*pyw setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au FileType *py,*pyw colorscheme advantage

