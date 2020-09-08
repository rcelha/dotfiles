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
set clipboard^=unnamed,unnamedplus

" Code Highlight


" multitab
" set tabpagemax=15 "15 tabs per instance
" map <C-m> <Esc>:tabn<CR>
" map <C-n> <Esc>:tabp<CR>
" map <C-l> <Esc>:tabs<CR>

" Use buffers for multiple files
set hidden  " Hides buffer instead of closing
map <C-m> <Esc>:bn<CR>
map <C-n> <Esc>:bp<CR>
map <C-l> <Esc>:ls<CR>

" move line
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

set wildmode=list:full
set wildmenu

" Turn on filetype
filetype plugin indent on

" Spelling config
hi clear SpellBad
hi SpellBad cterm=undercurl ctermfg=009 ctermbg=011 guifg=#ff0000 guibg=#ffff00

" Switching themes
let g:cycle_colors=[]
call add(g:cycle_colors, ['dark', 'two-firewatch', 'dark'])
call add(g:cycle_colors, ['light', 'papercolor', 'papercolor'])
function CycleTheme()
    " if current color is last
    let l:current_color = g:colors_name
    let l:next_color = 0

    if current_color !=? g:cycle_colors[-1][1]
        for thetheme in g:cycle_colors
            let thebackground = thetheme[0]
            let thecolor = thetheme[1]
            let l:next_color += 1
            if l:current_color == thecolor
                break
            endif
        endfor
    endif

    execute 'set background=' . g:cycle_colors[l:next_color][0]
    execute 'colors ' . g:cycle_colors[l:next_color][1]
    execute 'AirlineTheme ' . g:cycle_colors[l:next_color][2]
endfunction

function CycleThemeReset()
    execute 'set background=' . g:cycle_colors[0][0]
    execute 'colors ' . g:cycle_colors[0][1]
endfunction
map <silent> <C-c> :call CycleTheme()<CR>

" Plug
call plug#begin('~/.vim-plug')

" Distraction free mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Utils plugins
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|venv)|node_modules|__pycache__|env$',
  \ 'file': '\v\.(exe|so|dll|pyc|class|png|jpg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }  " markdown preview
Plug 'vim-airline/vim-airline'  " Status bar
Plug 'vim-airline/vim-airline-themes'  " Status bar themes
Plug 'edkolev/tmuxline.vim'  "  Tmux bar integration
Plug 'sheerun/vim-polyglot'  " Syntax pack
Plug 'tpope/vim-fugitive'  " Git commands
Plug 'airblade/vim-gitgutter'  " Git diff in the gutter

" Colors
Plug 'flazz/vim-colorschemes'

" COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
" COC colors
""
func! s:my_colors_setup() abort
    hi Pmenu ctermbg=black ctermfg=white
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END

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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <c-@> coc#refresh()
set updatetime=300
set signcolumn=yes


call plug#end()

" Things that need to be configured after Plug
call CycleThemeReset()

" Use airline to dislpay buffers and tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
" Configure tmux airline to be minimalistic
let g:tmuxline_preset = 'minimal'
let g:tmuxline_powerline_separators = 0
