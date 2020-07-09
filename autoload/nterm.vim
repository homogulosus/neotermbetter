" ===========================================
" Name: Terminal Better
" Author: homogulosus
" License: same as neovim
" Last Update: Thu Jul  9 14:28:17 EDT 2020
" ===========================================

let s:save_cpo = &cpo
set cpo&vim

" FIXME autocmd and resize are trigered also with the normal termianl command.
" Solution: probably making it a plugin and saving cpo
" Terminal more appealing
function! nterm#nterm_better() abort
  augroup term_better
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
    autocmd TermOpen * if &buftype ==# 'terminal' | resize 10 | startinsert | endif
    autocmd BufLeave term://* stopinsert
    autocmd TermClose term://*
      \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
      \   call nvim_input('<CR>')  |
      \ endif
  augroup END
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
