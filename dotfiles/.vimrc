" Default .vimrc from github.com/vim/vim/master/runtime/defaults.vim
" Added here so I can expand upon it


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200         " keep 200 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set wildmenu            " display completion matches in a status line

set ttimeout            " time out for key codes
set ttimeoutlen=100     " wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
  :unlet c_comment_strings
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

" ------------------------------------------------------
"
" Custom settings
"
" ------------------------------------------------------

" Switch cursor on input
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"


" Install vim-plug automatically
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Load Material Theme color scheme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()

" Apply Material Theme color scheme
let g:material_theme_style = 'default-community'
let g:material_terminal_italics = 1
colorscheme material

" Fix using terminal colors
if (has('termguicolors'))
  set termguicolors
endif



function! s:expand_commit_template() abort
  let branch = matchstr(system('git rev-parse --abbrev-ref HEAD'), '\p\+')
  let context = {
        \ 'BRANCH': 'Branch: ' . branch,
    \ 'PR': 'PR: ' . matchstr(system('hub pr list -f "%i %H%n" | grep ' . branch), '^\#\d\+')
        \ }

  let lnum = nextnonblank(1)
  while lnum && lnum < line('$')
    call setline(lnum, substitute(getline(lnum), '\${\(\w\+\)}',
          \ '\=get(context, submatch(1), "")', 'g'))
    let lnum = nextnonblank(lnum + 1)
  endwhile
endfunction

autocmd BufRead */.git/COMMIT_EDITMSG call s:expand_commit_template()
autocmd BufRead */.git/COMMIT_EDITMSG normal! j

function! s:expand_pr_template() abort
        let branch = matchstr(system('git rev-parse --abbrev-ref HEAD'), '\p\+')
        let title = substitute(branch, '--\(\w\)', '] \u\1', 'g')
        let title = substitute(title, '-',  '§', '')
        let title = substitute(title,  '-',  ' ' , 'g')
        let title = substitute(title, '§', '-', '')
        let title = substitute(title, '\w\+\/', '[', 'g')
        call setline(1, title)
        call append(line('.'), '')
        call append(line('.'), '')
endfunction

autocmd BufRead */.git/PULLREQ_EDITMSG call s:expand_pr_template()
autocmd BufRead */.git/PULLREQ_EDITMSG normal! jj


