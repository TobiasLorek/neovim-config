" Mappings --------------------------------  {{{
" VIMRC
noremap <leader>ev :tabnew $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

noremap <space> za
noremap <C-J>	:tabp<CR>
noremap <C-K>	:tabn<CR>
" }}}

" Pluggins ------------------------------- {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'joshdick/onedark.vim'
call plug#end()
" }}}

" Colorscheme ------------------------------- {{{
set background=dark
colorscheme onedark
" }}}

" Current line ------------------------------- {{{
set cursorline
set cursorcolumn
set colorcolumn=100
" }}}

" Tabs ------------------------------- {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
" }}}

" Search options ---------------------------------- {{{
set ignorecase
set smartcase
set hlsearch
set nowrapscan
" }}}

"Undo and backup files ----------------------------- {{{
set undodir=~/.config/nvim/undo/
set backupdir=~/.config/nvim/backup/
set directory=~/.config/nvim/swap/
set undofile
" }}}

"Viminfo -------------------------------- {{{
set viminfo='1000 " 'store marks for 1000 files '
set viminfo+=f1 " Stores file marks
set viminfo+=<100 "Limit registers to 100 lines
set viminfo+=h " Forgett hlsearch
" }}}

" Wildmenu ----------------------------- {{{
set wildmenu
set wildmode=list:full
" }}}

"Netwr --------------------------------- {{{
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
" }}}

" Split -------------------------------- {{{
set splitright
" }}}

" Foldmethods ------------------------------- {{{
augroup foldmethods
	autocmd!
	autocmd BufEnter *.vim setlocal foldmethod=marker
	autocmd BufEnter *.py setlocal foldmethod=indent
augroup end
" }}}

" CoC -------------------------------- {{{
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" }}}
