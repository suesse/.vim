set nocompatible
set hidden
set backspace=indent,eol,start
set mousehide
set shortmess=atI
set history=500
set wildmenu
set wildmode=list:longest,full

" better search
set incsearch
set ignorecase
set smartcase
set hlsearch

set showcmd
set showmode
set statusline=%F%m%r%h%w\ (%04l,%03v)\ %p%%:%L\ %Y
set laststatus=2
set viminfo='20,<50,s10,h,%

" tabstop 2 spaces
set sw=2 sts=2 ts=2 et
set smartindent

" set unix as default line endings
set ff=unix

" eliminate error bells
set noerrorbells
set visualbell t_vb=
if has("autocmd")
  autocmd GUIEnter * set visualbell t_vb=
endif

filetype plugin indent on

" highlight matching parens/braces/etc
runtime macros/matchit.vim 

" line numbers
"set number

" colorscheme
" wombat: http://dengmao.wordpress.com/2007/01/22/vim-color-scheme-wombat/
color wombat
syntax on

" GUI cursor
set gcr=n-v-c:block-blinkwait750-blinkon1000-blinkoff500,i-ci-r-cr:hor25-blinkwait750-blinkon1000-blinkoff500

" GUI font
set guifont=Consolas:h9:cANSI

" spellchecking
set spell
set spelllang=en_us
set spellsuggest=3
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" add all Go plugins
set rtp+=$GOROOT/misc/vim

" add 'Tabs' menu
amenu Tabs.&New :tabnew<cr>
amenu Tabs.&Delete :confirm tabclose<cr>
amenu Tabs.-SEP- :
amenu <silent> Tabs.&Next :tabnext<cr>
amenu <silent> Tabs.&Previous :tabprevious<cr>

" ============ CUSTOM MACROS ============
command GREP :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc
command CLEAN :%s/\s\+$//e
command TAGS :TlistToggle " http://www.vim.org/scripts/script.php?script_id=273

" ========= custom key bindings =========
" fix goto file current buffer not saved annoyance
map gf :edit <cfile><cr>
set isfname+=32

" toggle folding
nnoremap <space> za

" tab navigation
"nnoremap > :tabnext<cr>
"nnoremap < :tabprevious<cr>

" custom filetype associations
autocmd BufRead,BufNewFile *.json set ft=javascript
