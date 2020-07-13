" ===================================
" Name: pimpmyterm
" Maintainer: homogulosus
" Version: 0.4
" Date: Thu Jul  9 14:55:31 EDT 2020
" ===================================

if exists('g:loaded_ntermfix') && !has('nvim')
  finish
endif
let g:loaded_ntermfix = 1

let s:save_cpo = &cpo
set cpo&vim

augroup BetterTerm
  autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * if &buftype ==# 'terminal' | startinsert | endif
    autocmd BufLeave term://* stopinsert
    autocmd TermClose term://*
      \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
      \   call nvim_input('<CR>')  |
      \ endif
augroup END

function! NEOterm_better() abort
  silent! execute "wincmd n"
  silent! execute "terminal"
  resize 10
endfunction

" map T to open a terminal window on the botton of the screen since we have splitbelow on
command! Terminal call NEOterm_better()
nmap <silent><leader>T  :Terminal<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
