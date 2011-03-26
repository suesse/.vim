source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

runtime macros/matchit.vim
set hidden
set nocompatible
set nowrap
set incsearch
" fix backspace
set backspace=indent,eol,start

syntax on
filetype on
filetype indent on
filetype plugin on

set ruler
set mousehide
set autochdir
set guioptions+=ca
set shortmess=atI
set history=500
set wildmenu
set wildmode=list:longest,full
set ignorecase
set smartcase
set showcmd
" UNIX line endings
set ff=unix
set ffs=unix,dos
" spaces instead of tabs
set sw=2 sts=2 ts=2 et
" get rid of trash
set nobackup
set nowritebackup
set noswapfile
set viminfo='20,<50,s10,h,%

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

set noerrorbells
set visualbell t_vb=
if has("autocmd")
  autocmd GUIEnter * set visualbell t_vb=
  " Remove unecessary whitespace from the end of lines on write buffer.
  " autocmd BufWritePre * :%s/\s\+$//e
endif

color wombat
cnoreabbrev bd Kwbd
cnoreabbrev q Kwbd
set guifont=Consolas:h9:cANSI
" highlight columns 80+
match OverLength /\%81v.\+/

" Easily GREP current word in current file.
command GREP :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc

" Remove unnecessary whitespace from current buffer.
command CLEAN :%s/\s\+$//e

" F5 - insert current date and time
:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

