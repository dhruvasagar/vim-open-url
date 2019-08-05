if exists('g:loaded_open_url')
  finish
endif
let g:loaded_open_url = 1

if !exists('g:open_url_browser_default')
  let g:open_url_browser_default = 'xdg-open'
endif

command! -nargs=1 OpenURL call open_url#open(<q-args>)
command! -nargs=+ -complete=file OpenIn call open_url#open_in(<f-args>)
command! -nargs=1 -complete=file OpenInChrome OpenIn Google\ Chrome <q-args>

nnoremap <Plug>(open-url-browser) :OpenURL <cfile><CR>
xnoremap <Plug>(open-url-browser) :<C-U>OpenURL <C-R>=open_url#get_selection()<CR><CR>
nnoremap <Plug>(open-url-wiki-search) :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>
xnoremap <Plug>(open-url-wiki-search) :<C-U>OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<C-R>=open_url#get_selection()<CR><CR>
nnoremap <Plug>(open-url-google-search) :OpenURL http://www.google.com/search?q=<cword><CR>
xnoremap <Plug>(open-url-google-search) :<C-U>OpenURL http://www.google.com/search?q=<C-R>=open_url#get_selection()<CR><CR>

if !hasmapto('<Plug>(open-url-browser)', 'n')
  nmap gB <Plug>(open-url-browser)
endif
if !hasmapto('<Plug>(open-url-browser)', 'x')
  xmap gB <Plug>(open-url-browser)
endif
if !hasmapto('<Plug>(open-url-wiki-search)', 'n')
  nmap gW <Plug>(open-url-wiki-search)
endif
if !hasmapto('<Plug>(open-url-wiki-search)', 'x')
  xmap gW <Plug>(open-url-wiki-search)
endif
if !hasmapto('<Plug>(open-url-google-search)', 'n')
  nmap gG <Plug>(open-url-google-search)
endif
if !hasmapto('<Plug>(open-url-google-search)', 'x')
  xmap gG <Plug>(open-url-google-search)
endif
