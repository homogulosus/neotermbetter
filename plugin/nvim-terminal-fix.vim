if exists('g:loaded_ntermfix') && !has('nvim')
  finish
endif
let g:loaded_ntermfix = 1

let s:save_cpo = &cpo
set cpo&vim

" map T to open a terminal window on the botton of the screen since we have splitbelow on
command! Terminal call nterm#nterm_better()
nmap <silent><leader>T :term<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
