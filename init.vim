"
"
"

" basic settings
colorscheme industry
set number
set tabstop=8
set shiftwidth=2
set hlsearch
set splitright
set ruler
set guioptions=-T
set t_Co=256
set nowrap

set tw=2048
set sw=2
set ts=8
set colorcolumn=80,120

set list
set listchars=tab:>.,trail:_,eol:$,extends:>,precedes:<,nbsp:%

set expandtab
set cindent

set clipboard=unnamed
set mouse=a

set shellslash
set notitle
set nobackup
set noundofile
set lazyredraw

set tags=./tags,tags,../tags,../../tags,../../../tags,../../../../tags

" basic buffer settings
set fileformat=unix
set fileencoding=utf-8



" Load settings for each location.
" http://vim-users.jp/2009/12/hack112/
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
  autocmd BufReadPre vimrc set ft=vim
augroup END
function! s:vimrc_local(loc)
  let files = findfile('vimrc', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

"
" Quickfix
"
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen


"
" lightline
"
set laststatus=2
let g:lightline = {
  \ 'colorscheme' : 'PaperColor',
  \ }


"
" NERDTree
"
map <C-e> :NERDTreeToggle<CR>
let g:NERDTreeShowBookmars=1


"
" deoplete
"
let g:deoplete#enable_at_startup=1
let g:deooplete#enable_smart_case=1
let g:deooplete_enable_underbar_completion=1
let g:deooplete_enable_camel_case_completion=1
let g:deooplete#max_list=20

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "<C-p>" : "<S-TAB>"
inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"


"
" GNU global
"
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>



"
" reload vimrc
"
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END


filetype plugin indent on
syntax on


