set encoding=utf8

" Code Highlight
set t_Co=256
" set background=dark

syntax enable
" tab as space
set expandtab

" tab size "
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4

" some tab features
set autoindent
set smarttab

" search
set incsearch "live
set ic "ignoring case
set hlsearch
" showing some info

set number "line number
set title  "title in term
set laststatus=2 "fname in status bar

" editor stuff
set showmatch "show {} and [] open/close tags
" set textwidth=79 "break on 79o caracter
" set pastetoggle=<C-v> "copy mode

" Copy and Paste from transfer area
" nmap y <Plug>SystemCopy
" xmap y <Plug>SystemCopy
" nmap p <Plug>SystemPaste
" nmap yy <Plug>SystemCopyLine
" multitab

set tabpagemax=15 "15 tabs per instance
map <C-m> <Esc>:tabn<CR>
map <C-n> <Esc>:tabp<CR>
map <C-l> <Esc>:tabs<CR>

" move line
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

set wildmode=list:full
set wildmenu

" Switching themes
let g:mydark_colors = 'CandyPaper'
let g:mylight_colors = 'summerfruit256'
function! s:SwitchTheme()
    if g:colors_name == g:mydark_colors
        execute 'colo ' . g:mylight_colors
    else
        execute 'colo ' . g:mydark_colors
    endif
endfunction
map <silent> <C-c> :call <SID>SwitchTheme()<CR>

" Plug
call plug#begin('~/.vim-plug')

" Utils plugins
Plug 'stephpy/vim-yaml'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
" Clipboard utility
Plug 'christoomey/vim-system-copy'

" Syntax
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'leafgarland/typescript-vim'
Plug 'jeroenbourgois/vim-actionscript', { 'for': 'actionscript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_folding_disabled = 1
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'fatih/vim-go'
Plug 'saltstack/salt-vim'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'rodjek/vim-puppet'

" Colors
Plug 'flazz/vim-colorschemes'

" Plugin configurations
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|__pycache__|env$',
  \ 'file': '\v\.(exe|so|dll|pyc|class)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

filetype plugin indent on
call plug#end()

colo CandyPaper
