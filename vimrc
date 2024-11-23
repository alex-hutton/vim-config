let &runtimepath.=',$HOME/.dots/vim-config/'
runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype plugin indent on
execute pathogen#infect()

syntax enable
colorscheme darkburn

let g:lightline = {}
let g:lightline.colorscheme = 'apprentice'
let g:lightline.active = { 'right': [ [ 'percent' ], [ 'lineinfo' ], [ 'filetype'] ] }

highlight DiffAdd    ctermfg=82 ctermbg=22
highlight DiffDelete ctermfg=160 ctermbg=52
highlight DiffChange ctermbg=17
highlight DiffText   ctermbg=53

set backupdir=$HOME/.dots/vim-config/backup

set paste  " This resets expandtab, so should go before it.

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
set noshowmode
set noswapfile
set number
set ruler
set shiftwidth=2
set smartcase
set softtabstop=2
set t_Co=256
set t_vb=
set tabstop=2
set textwidth=79
set visualbell
set wildmenu

set grepprg=git\ grep\ -n

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    nmap <buffer> gd <plug>(lsp-definition)      " Go to definition
    nmap <buffer> gr <plug>(lsp-references)      " Find all references
    nmap <buffer> gt <plug>(lsp-type-definition) " Go to type definition
    nmap <buffer> gK <plug>(lsp-call-heirarchy-incoming) " Call tree
    nmap <buffer> gJ <plug>(lsp-call-heirarchy-outgoing) " Call tree
    nmap <buffer> <f2> <plug>(lsp-rename)        " Rename
    nmap <buffer> <f3> <plug>(lsp-hover)         " Gets 'hover' information
    nmap <buffer> <f4> <plug>(lsp-document-symbol-search)  " list of symbols
    nmap <buffer> <f5> <plug>(lsp-document-diagnostics)  " linting
    let g:lsp_diagnostics_virtual_text_enabled=0
    let g:lsp_diagnostics_highlights_enabled=0
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

highlight LineNr ctermfg=green

command! W w !sudo tee % > /dev/null

nnoremap <leader>q Oimport ipdb; ipdb.sset_trace()<Esc>==

nnoremap <PageDown> <Nop>
nnoremap <PageUp> <Nop>

nnoremap Q <Nop>
nnoremap q: <Nop>
nnoremap gQ <Nop>

nnoremap <Tab> :source $MYVIMRC<CR> :retab<CR>

autocmd BufRead,BufNewFile,BufEnter *.yang setfiletype xml

autocmd FileType make setlocal noexpandtab

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python
  \  source $HOME/.dots/vim-config/misc/python_match/ftplugin/python_match.vim

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

command! CloseOtherBuffers %bd|e#
