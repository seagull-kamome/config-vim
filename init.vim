"
"
"

" basic settings
"colorscheme industry
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

set cursorline

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



"
" spell checker
"
set nospell
let g:enable_spelunker_vim=1
let g:enable_spelunker_vim_on_readonly=0
let g:spelunker_target_min_char_len=4
let g:spelunker_max_suggest_words=15
let g:spelunker_max_hi_words_each_buf=100
let g:spelunker_check_type=1
let g:spelunker_highlight_type=1
let g:spelunker_disable_auto_group=1
augroup spelunker
  autocmd!
  autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md call spelunker#check()
  autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE




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
inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"


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


