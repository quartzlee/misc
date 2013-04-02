set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
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

set nocompatible  	" disable vi compatibility

"
" Set vim options
"
set autoindent			" carry over indenting from previous line
set backspace=2			" allow backspace beyond insertion point
"set background=dark		" 

"set encoding=utf-8
set fileencoding=utf-8
set expandtab			" spaces, not tabs

set nowrap				" don't automatically wrap lines
set number				" turn on line numbering

set report=1			" alwarys report changes
set ruler				" display cursor position

set showmatch			" 

set shiftwidth=4
set softtabstop=4
set tabstop=4

"set title				" do set the xterm title ( see 'titleold', set below

set undolevels=9999		" lots of undo history

filetype plugin on      " use ftplugins
syntax on               " enable syntax highlighting


if has("gui_running")
  if has("gui_gtk2")
    set guifont=Courier\ New\ 11
  elseif has("gui_win32")
    set guifont=Courier\ New:h11:cANSI
  endif
endif



"
" macros
"
map Y y$



"
" lisp
"
set lispwords-=if

if has("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

" By default vim will indent arguments after the function name
" but sometimes you want to only indent by 2 spaces. Set the 
" `lispwords` variable to add function names that should have
" this type of indenting.
set lispwords+=public-method,override-method,private-method
set lispwords+=syntax-case,syntax-rules,case-lambda




" misc
colorscheme pablo
