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

" Copy and Paste from transfer area
set pastetoggle=<F2> "copy mode
set clipboard=unnamed


" multitab
" set tabpagemax=15 "15 tabs per instance
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
let g:cycle_colors=['candy', 'summerfruit256', 'Monokai', 'PaperColor']
" let g:cycle_colors=['spacecamp', 'summerfruit256']
function CycleTheme()
    " if current color is last
    let l:current_color = g:colors_name
    let l:next_color = 0

    if current_color !=? g:cycle_colors[-1]
        for thecolor in g:cycle_colors
            let l:next_color += 1
            if l:current_color == thecolor
                break
            endif
        endfor
    endif

    echom '-> ' . g:cycle_colors[l:next_color]
    execute 'colors ' . g:cycle_colors[l:next_color]
endfunction
map <silent> <C-c> :call CycleTheme()<CR>

" Plug
call plug#begin('~/.vim-plug')
" Utils plugins
Plug 'stephpy/vim-yaml'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|venv)|node_modules|__pycache__|env$',
  \ 'file': '\v\.(exe|so|dll|pyc|class|png|jpg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
Plug 'vim-airline/vim-airline'

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
Plug 'airblade/vim-gitgutter'
Plug 'mustache/vim-mustache-handlebars'

" COC
" Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}

" Format selection
vmap <C-f>  <Plug>(coc-format-selected)
nmap <C-f>  <Plug>(coc-format-selected)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Double tap space to list COC commands
nnoremap <silent> <Space><Space> :CocCommand<CR>

" Colors
Plug 'flazz/vim-colorschemes'
Plug 'jaredgorski/spacecamp'

filetype plugin indent on
call plug#end()

execute 'colors ' . g:cycle_colors[0]

hi clear SpellBad
hi SpellBad cterm=undercurl
