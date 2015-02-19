if exists('g:loaded_open_url')
  finish
endif
let g:loaded_open_url = 1

command! -nargs=1 OpenURL call open_url#open(<q-args>)

nnoremap gB :OpenURL <cfile><CR>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>
