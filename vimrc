let &runtimepath.=',$HOME/.dots/vim-config/'
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

syntax enable
colorscheme brighton

highlight DiffAdd    ctermfg=82 ctermbg=22
highlight DiffDelete ctermfg=160 ctermbg=52
highlight DiffChange ctermbg=17
highlight DiffText   ctermbg=53

set backupdir=$HOME/.dots/vim-config/backup

set autoindent
set colorcolumn=+1
set cursorline
set expandtab
set formatoptions-=tc
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set modeline
set noerrorbells
set noswapfile
set number
set ruler
set shiftwidth=2
set smartcase
set smarttab
set softtabstop=2
set t_Co=256
set t_vb=
set tabstop=2
set textwidth=79
set visualbell
set wildmenu

highlight LineNr ctermfg=green

command! W w !sudo tee % > /dev/null

nnoremap <leader>q Oimport ipdb; ipdb.sset_trace()<Esc>==

nnoremap <PageDown> <Nop>
nnoremap <PageUp> <Nop>

nnoremap Q <Nop>
nnoremap q: <Nop>
nnoremap gQ <Nop>

autocmd BufRead,BufNewFile,BufEnter *.yang setfiletype xml

autocmd FileType make setlocal noexpandtab

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python
	\	source $HOME/.dots/vim-config/misc/python_match/ftplugin/python_match.vim

command! Prose execute "Goyo | Limelight | PencilSoft"
command! ProseCancel execute "Goyo! | Limelight! | PencilOff"

autocmd WinEnter * set colorcolumn=+1
autocmd WinLeave * set colorcolumn=0

highlight Scrollbar_Thumb ctermfg=green ctermbg=green cterm=none

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }


function! s:DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
