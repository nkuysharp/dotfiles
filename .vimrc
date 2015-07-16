set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set t_Co=256

" diff settings ------------- {{{
set diffexpr=MyDiff()
function! MyDiff()
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
" }}}


set number
"set autoindent
set shiftwidth=4
set tabstop=4
set et
set smarttab

set nohlsearch
set incsearch

" 2014.12.25
let mapleader = ","

" set colorscheme 
colorscheme SORuby


" insert mode abbreviations
abbrev @@ nkuysharp@gmail.com
iabbrev @g nkuysharp@gmail.com
iabbrev @n yuwenqing@nbjl.nankai.edu.cn

" mappings
" normal mode mappings --------------- {{{ 
" map H to move to previous tab
nnoremap H gT
" map L to move to next tab
" nnoremap L gt
nnoremap ev :vsplit $MYVIMRC<cr> 
nnoremap sv :source $MYVIMRC<cr> 
nnoremap < 0
nnoremap <c-e> $
" save and close all buffers
nnoremap <leader>ww :wqall<cr>
" open ConqueTerm bash in a new tab
nnoremap <leader>tb :ConqueTermTab bash<cr>
" }}}




" visual mode settings ----------- {{{
" surround the selected area by quotes
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
" }}}

" insert mode mappings -------------- {{{ 
" upcase the word in insert mode
inoremap <c-u> <esc>viwUea
" map a fashion way to exit insert mode
inoremap jk <esc>
" map <c-b> to move left
inoremap <c-b> <esc>i
" }}}


" auto commands
" comment the current line
augroup pretty_format
    autocmd!
    autocmd BufWritePre *.html :normal gg=G
augroup END

" comment settings ------------------ {{{
augroup comment_line
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>c I#
    autocmd FileType c nnoremap <buffer> <leader>c I//
    autocmd FileType cpp nnoremap <buffer> <leader>c I//
augroup END
" }}}

"markdown file settings ------------------- {{{
augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd BufNewFile,BufRead *.md inoremap <cr> <space><space><space><space><cr>
augroup END
" }}}

"vimscript file settings ------------------ {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

"tex file settings ------------------ {{{ 
augroup filetype_tex
    autocmd!
    autocmd FileType tex nnoremap <buffer> <leader>mm :!pdflatex.exe %<cr>
augroup END
" }}}



"set the status line
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines



" ================= plugins settings ========================

" vimgdb settings --------------------- {{{
syntax enable			    " enable syntax highlighting
set previewheight=12		" set gdb window initial height
let g:ConqueGdb_Leader = '\'

run macros/gdb_mappings.vim	" source key mappings listed in this document
"set asm=0				    " don't show any assembly stuff
"set gdbprg=gdb_invocation	" set GDB invocation string (default 'gdb')

" }}}

function! Printhello(name)
    echo a:name
endfunction

" Vundle settings -------------- {{{    
     
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'tomasr/molokai'
Plugin 'Shougo/vimshell.vim'
    
call vundle#end()            " required
filetype plugin indent on    " required
         
" ------------------- }}}

