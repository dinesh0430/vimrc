"{{{  Default configuration provided by VIM itself with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
"}}}

" vim-plug: Plugin repository lines {{{
" For vim-plug to work done as told by a medium article 
call plug#begin('~/vimfiles/v_plug')

" Colorscheme 
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" fzf 
Plug 'junegunn/fzf',  { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" Vim airline and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plugin to manage buffers, files, windows, tabs 
Plug 'vim-ctrlspace/vim-ctrlspace' 
Plug 'ctrlpvim/ctrlp.vim'

" Plugin to search and autocomplete unicode characters
Plug 'chrisbra/unicode.vim'

" Plugin to get dev icons
Plug 'ryanoasis/vim-devicons'

" Plugin to NERDTree
Plug 'preservim/nerdtree'

" Plugin to modify start screen of vim
Plug 'mhinz/vim-startify'

" Plugin to integrate rigrep into vim
Plug 'jremmen/vim-ripgrep'

call plug#end()
" }}}

" Colorscheme used by getting from plugin 'OneHalf' -- 'Light' & 'Dark'
colorscheme onehalfdark
let g:airline_theme='onedark'

" GUI option to remove toolbar 
set guioptions-=T

" Gutter( space beside line numbers ) width for seeing foldlines
set foldcolumn=2

" For removing annoying files automatically created by vim during saving files (*~)
set nobackup
set nowritebackup
set noswapfile
set undodir=$HOME/vimfiles/undo-dir     "directory where the undo files will be stored
set undofile                            "turn on the feature

" Relative and original numbering
set nu rnu

" Useful in searching with words
set ignorecase
set smartcase

" To remove unnecessary mode information below airline
set noshowmode

" UTF-8 encoding
set encoding=utf-8
set renderoptions=type:directx

" Set GUI font size
" set guifont=Consolas:h10
set guifont=FiraCode\ NF:h11

" To disable beep sound 
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


" Powerline fonts config
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ' L'
let g:airline_symbols.dirty='⚡'

" set 'hidden' option makes sure that buffers can be switched without saving them, this is necessary for CtrlSpace to work as expected
set hidden

" Remapping <Enter> so that the search pattern highlight is removed after the search is over
nnoremap <silent> <cr> :noh<CR>

" Remap <Ctrl-n> to BackSpace
map <C-n> <BS>
map! <C-n> <BS>

" Remap <Ctrl-h> to nothing to start using <ctrl-n>
map! <c-h> <nop>

" Airline tabline 
let g:airline#extensions#tabline#enabled = 1

" GUI Window to start maximised
autocmd GUIEnter * simalt ~x

" To use ripgrep for Ctrl-P plugin
if executable('rg')
	  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
  endif
" vim modeline below (( USEFUL ))
" vim: foldmethod=marker
