set encoding=utf8

" Code Highlight
set t_Co=256
" set background=dark

syntax on
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
set clipboard^=unnamed,unnamedplus

" multitab
" set tabpagemax=15 "15 tabs per instance
" map <C-m> <Esc>:tabn<CR>
" map <C-n> <Esc>:tabp<CR>
" map <C-l> <Esc>:tabs<CR>

" Use buffers for multiple files
" set hidden  " Hides buffer instead of closing
map <C-n> <Esc>:bn<CR>
map <C-b> <Esc>:bp<CR>
map <C-l> <Esc>:ls<CR>

" move line
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" Y copies until the end of the line
nnoremap Y y$

" Keeps cursor centered on n/N
nnoremap n nzzzv
nnoremap N Nzzzv

" Breake undo sequence on stop characters
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u

set wildmode=list:full
set wildmenu

" Turn on filetype
filetype plugin indent on

" Spelling config
hi clear SpellBad
hi SpellBad cterm=undercurl ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00

" Switching themes
let g:cycle_colors=[]
let g:cycle_colors_current_index=0
call add(g:cycle_colors, ['dark', 'PaperColor', 'dark'])
call add(g:cycle_colors, ['light', 'PaperColor', 'papercolor'])

function CycleThemeReset()
    execute 'set background=' . g:cycle_colors[g:cycle_colors_current_index][0]
    execute 'colors ' . g:cycle_colors[g:cycle_colors_current_index][1]
    if exists(':AirlineTheme')
        execute 'AirlineTheme ' . g:cycle_colors[g:cycle_colors_current_index][2]
    endif
endfunction

function CycleTheme()
    if g:cycle_colors_current_index + 1 >= len(g:cycle_colors)
        let g:cycle_colors_current_index = 0
    else
        let g:cycle_colors_current_index = g:cycle_colors_current_index + 1
    endif
    call CycleThemeReset()
endfunction

map <silent> <C-c> :call CycleTheme()<CR>

" Plug
call plug#begin('~/.vim-plug')

" Distraction free mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:goyo_width = 120


" Utils plugins
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|venv)|node_modules|__pycache__|env$',
  \ 'file': '\v\.(exe|so|dll|pyc|class|png|jpg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm i'  }  " markdown preview
Plug 'vim-airline/vim-airline'  " Status bar
Plug 'vim-airline/vim-airline-themes'  " Status bar themes
Plug 'sheerun/vim-polyglot'  " Syntax pack
Plug 'tpope/vim-fugitive'  " Git commands
Plug 'airblade/vim-gitgutter'  " Git diff in the gutter
Plug 'NoahTheDuke/vim-just' " https://github.com/casey/just

" Colors
Plug 'flazz/vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Rykka/riv.vim'  " RST plugin. Main use is for Python sphinx docstrings
let g:riv_python_rst_hl=1
let g:riv_highlight_code = 'python,rust,javascript,vim,sh'

" Highlight yanked
Plug 'machakann/vim-highlightedyank'
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif

" COC
let g:coc_global_extensions = ['coc-pyright', 'coc-yaml', 'coc-json', 'coc-tsserver', 'coc-prettier', 'coc-lists', 'coc-rust-analyzer' ]
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" COC colors
""
function MyColorSetup() abort
    hi CocErrorSign  ctermfg=Red guifg=#ff0000
    hi CocWarningSign  ctermfg=Brown guifg=#ff922b
    hi CocInfoSign  ctermfg=Yellow guifg=#fab005
    hi CocHintSign  ctermfg=Blue guifg=#15aabf
    hi CocUnderline  cterm=underline gui=underline
endfunction

" Format selection
vmap <C-f>  <Plug>(coc-format-selected)
nmap <C-f>  <Plug>(coc-format)
command! -nargs=0 CocFormat :call CocAction('format')
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Double tap space to list COC commands
nnoremap <silent> <Space><Space> :CocCommand<CR>
" Double tab tab for COC actions
nnoremap <silent> <Tab><Tab> :CocAction<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
set updatetime=300
set signcolumn=yes

call plug#end()

""
" Things that need to be configured after Plug

" Use airline to dislpay buffers and tabs
let g:airline#extensions#tabline#enabled = 1

" Set theme with cycletheme
autocmd User AirlineAfterInit
            \ call CycleThemeReset() |
            \ call MyColorSetup()
autocmd ColorScheme * call MyColorSetup()
