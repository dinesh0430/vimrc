"{{{  Default configuration provided by VIM itself with all enhancements
" vim modeline below (( USEFUL ))
" vim: foldmethod=marker
source $VIMRUNTIME/vimrc_example.vim
" cd $HOME/Documents/vimProjects

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
    set diffexpr=MyDiff()
endif
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

" Plugin to get dev icons
Plug 'ryanoasis/vim-devicons'

" Plugin to NERDTree
Plug 'preservim/nerdtree'

" Plugin to modify start screen of vim
"Plug 'mhinz/vim-startify'

" Plugin for easy motion in vim
Plug 'easymotion/vim-easymotion'

" incsearch in vim with a plugin for improved effectiveness
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Plugin to fastly move to words in same sentence
"Plug 'unblevable/quick-scope'

" Plugin which supports repeat on many other plugins
Plug 'tpope/vim-repeat'

" Plugin similar to surround but better and less known
Plug 'machakann/vim-sandwich'

" Plugin for markdown
Plug 'plasticboy/vim-markdown'

" Plugin to add text objects and extend the functionality of built-in text objects
Plug 'wellle/targets.vim'

" Compile single source files
Plug 'xuhdev/SingleCompile'

" To show indent characters
Plug 'Yggdroot/indentLine'

" To see indentation
Plug 'nathanaelkane/vim-indent-guides'

" Plugin to use undo feature
Plug 'mbbill/undotree'
Plug 'simnalamburt/vim-mundo'

call plug#end()
" }}}

" Colorscheme used by getting from plugin 'OneHalf' -- 'Light' & 'Dark'
colorscheme onehalfdark

" Airline theme to match the colorscheme
let g:airline_theme='onedark'

" Set mapleader
let mapleader=","

" Set local leader which could be benificial for buffer local mappings
let maplocalleader="\\"

" Needed to automate session saving process
set wildmenu
set wildmode=full

" To modify sessions saving defaults
set sessionoptions-=options
set sessionoptions+=help

" To set a global default sessions directory
let g:session_dir = '~\Documents\vimProjects\sessions'

" Mapping to automate session restore or session load and displap all matching files
exec 'nnoremap <Leader>sr :so ' . g:session_dir. '\*.vim<C-D><BS><BS><BS><BS><BS>'

" To display all matching session files while saving sessions
exec 'nnoremap <Leader>ss :mksession! ' . g:session_dir . '\*.vim<C-D><BS><BS><BS><BS><BS>'

" CTRL SPACE settings
" To have ag as glob command
let g:CtrlSpaceGlobCommand = 'fd --type file --exclude .git'
"let g:CtrlSpaceGlobCommand = 'rg --files'

" Exclude airline status for CtrlSpace so that we can view emoji
let g:airline_exclude_preview = 1
let g:CtrlSpaceUseArrowsInTerm = 1
let g:CtrlSpaceSymbols ={
                        \ "File": "📁",
                        \ "CS":"🚀",
                        \ "BM":"🔖",
                        \ "Sin":"📄",
                        \ "All":"🌟",
                        \ "Vis":"👁️",
                        \ "Tabs":"",
                        \ "CTab":"",
                        \ "NTM":"",
                        \ "WLoad":"🔻",
                        \ "WSave":"🔺",
                        \ "Zoom":"🔍",
                        \ "SLeft":"▶️",
                        \ "SRight":"◀️",
                        \ "Help":"❓",
                        \ "IV":"",
                        \ "IA":"",
                        \ "IM":" ",
                        \ "Dots":"",
                        \  }

" To display the count of number of searches
set shortmess-=S

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
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" set 'hidden' option makes sure that buffers can be switched without saving them
set hidden

" Remapping <Enter> so that the search pattern highlight is removed after the search is over
"nnoremap <silent> <cr> :noh<CR>

" Remap <Ctrl-n> to BackSpace
noremap <C-n> <BS>
noremap! <C-n> <BS>

" Remap to get fzf on <ctrl-f>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> q; :History:<CR>

" Remap <Ctrl-h> to nothing to start using <ctrl-n>
noremap! <c-h> <nop>

" To use <Ctrl-w/s> as <Up/Down> in command line mode
cnoremap <c-w> <Up>
cnoremap <c-s> <Down>
cnoremap <c-a> <Left>
cnoremap <c-d> <Right>
cnoremap <c-q> <Home>
cnoremap <c-d> <End>

" Airline tabline
let g:airline#extensions#tabline#enabled = 1

" GUI Window to start maximised
autocmd GUIEnter * simalt ~x

set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" To remove scrollbar, toolbar and menubar in gvim
set guioptions=

" Easymotion settings
" Disable default easymotion mappings and use only those mapping in vimrc
let g:EasyMotion_do_mapping = 0

" Type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" incsearch mappings
map / <Plug>(incsearch-forward)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" incsearch-fuzzy mapping
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" To remove the autocommenting of next line by pressing 'O' in normal mode
autocmd BufEnter *vimrc setlocal formatoptions-=cro

" To copy default mappings of vim-sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" File completion in command line ( here <TAB> is used as wildchar )
set wildmode=list,longest,full

" Abbrevations for commonly misspelled words
iabbrev adn and
iabbrev teh the
iabbrev waht what
iabbrev tehn then

"Test Buffer local abbrevations for overloading same key mappings for different languages
autocmd FileType python :iabbrev <buffer> iff if:<left>
autocmd FileType vim :iabbrev <buffer> iff dines


"Test autocmds grouping
" autocmd! (This prevents having the autocommands defined twice (e.g., after sourcing the .vimrc file again)).
augroup filetype_vim
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>f dd
augroup END

set tabstop=2
set softtabstop=4
set shiftwidth=4
" Expand tabs to spaces
set et

" To set the indentation character
let g:indentLine_char='|'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled=1

" To show invisible characters
set list

" To change the color of the invisible characters to be displayed
highlight SpecialKey ctermfg=8 guifg=DimGrey

" To configure the characters shown
set listchars=trail:·,extends:>,precedes:<

