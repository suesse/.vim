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

" tabstop 4 spaces
set sw=4 sts=4 ts=4 et
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
" OmniComplete
set ofu=syntaxcomplete#Complete

" highlight matching parens/braces/etc
"runtime macros/matchit.vim 

" line numbers
set number

" colorscheme
" wombat: http://dengmao.wordpress.com/2007/01/22/vim-color-scheme-wombat/
set background=dark
color wombat
syntax on
set showmatch

" ============ GO ============
set rtp+=$GOROOT/misc/vim
autocmd BufWritePre *.go : silent Fmt

" ========== Perl ============
" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

" ============ CUSTOM MACROS ============
command GREP :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc
command CLEAN :%s/\s\+$//e
command TAGS :TlistToggle " http://www.vim.org/scripts/script.php?script_id=273

" ============ Key Bindings ============
let mapleader=","
set isfname+=32

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>

" custom filetype associations
autocmd BufRead,BufNewFile *.json set ft=javascript

" make enter insert new Line in normal mode
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" ******************************************************************
"                             Plugins                              *
" ******************************************************************
" -------------------------------------
"           MiniBufExplorer
" -------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
let g:miniBufExplMaxSize = 1 " <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
"let g:miniBufExplForceSyntaxEnable = 1 " There is a Vim bug that can cause buffers to show up without their highlighting. The following setting will cause MBE to
"let g:miniBufExplorerMoreThanOne = 1 " Setting this to 0 will cause the MBE window to be loaded even
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavArrows = 1
"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guibg=LightGray guifg=DarkGray
" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guibg=Red guifg=DarkRed
" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=Gray guifg=Black
" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=DarkRed guifg=Black


" -------------------------------------
"                TagList
" -------------------------------------
" F4: Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>
" TagListTagName - Used for tag names
highlight MyTagListTagName gui=bold guifg=Black guibg=Orange
" TagListTagScope - Used for tag scope
highlight MyTagListTagScope gui=NONE guifg=Blue
" TagListTitle - Used for tag titles
highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray
" TagListComment - Used for comments
highlight MyTagListComment guifg=DarkGreen
" TagListFileName - Used for filenames
highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exit_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compact_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

" -------------------------------------
"            OmniCppComplete
" -------------------------------------
" set Ctrl+j in insert mode, like VS.Net
imap <C-j> <C-X><C-O>
" :inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<c-g>u\<CR>"
" set completeopt as don't show menu and preview
set completeopt=menuone
" Popup menu hightLight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 1
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0

