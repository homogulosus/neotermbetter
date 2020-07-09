if exists('g:loaded_ntermfix') && !has('nvim')
  finish
endif
let g:loaded_ntermfix = 1

let s:save_cpo = &cpo
set cpo&vim

" FIXME autocmd and resize are trigered also with the normal termianl command.
" Solution: probably making it a plugin and saving cpo
" Terminal more appealing
function! g:NTermFix() abort
  autocmd indispensable TermOpen * setlocal nonumber norelativenumber
  " wind resizing
  augroup term_settings | autocmd!
    autocmd TermOpen * if &buftype ==# 'terminal' | resize 10 | startinsert | endif
    autocmd BufLeave term://* stopinsert
    autocmd TermClose term://*
      \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
      \   call nvim_input('<CR>')  |
      \ endif
  augroup END
endfunction

" map T to open a terminal window on the botton of the screen since we have splitbelow on
nmap <silent><leader>T :sp +terminal<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
