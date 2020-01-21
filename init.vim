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
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-sensible'
Plug 'joshdick/onedark.vim'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'jeetsukumaran/vim-pythonsense'
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


nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" }}}

" ALE ------------------------------------------- {{{

let g:ale_fixers = {
      \    'python': ['standardrb'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" }}}

" UltiSnips ------------------------------- {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}

" VimWiki ------------------------------- {{{
let g:vimwiki_list = [{'path': '~/my_mess', 'syntax': 'markdown', 'ext': '.wiki'}]

" }}}

" FZF -------------------------------- {{{
noremap <C-P> :FZF<CR>
" }}}
