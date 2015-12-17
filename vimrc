runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax enable
colorscheme advantage

set backupdir=~/.vim/backup/

set autoindent
set colorcolumn=+1
set cursorline
set formatoptions-=t
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set modeline
set noswapfile
set number
set shiftwidth=2
set smartcase
set smarttab
set t_Co=256
set tabstop=2
set textwidth=79
set wildmenu


highlight LineNr ctermfg=green

command! W w !sudo tee % > /dev/null

nnoremap <leader>q Oimport pdb; pdb.set_trace()<Esc>==

autocmd BufRead,BufNewFile,BufEnter *.yang setfiletype xml
autocmd BufRead,BufNewFile,BufEnter package.json,bower.json
	\	setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python
	\	source ~/.vim/misc/python_match/ftplugin/python_match.vim

command! Prose execute "Goyo | Limelight | PencilSoft"
command! ProseCancel execute "Goyo! | Limelight! | PencilOff"

autocmd WinEnter * set colorcolumn=+1
autocmd WinLeave * set colorcolumn=0

function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
