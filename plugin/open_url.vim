if exists('g:loaded_open_url')
  finish
endif
let g:loaded_open_url = 1

function! s:SetGlobalOpt(opt, val)
  if !exists('g:'.a:opt)
    let g:{a:opt} = a:val
  endif
endfunction

call s:SetGlobalOpt('open_url_browser_default', 'sensible-browser')

command! -nargs=1 OpenURL call open_url#open(<q-args>)
command! -nargs=+ -complete=file OpenIn call open_url#open_in(<f-args>)
command! -nargs=1 -complete=file OpenInChrome OpenIn Google\ Chrome <q-args>

nnoremap <Plug>(open-url-browser) :OpenURL <cfile><CR>
vnoremap <Plug>(open-url-browser) <Esc>:OpenURL <C-r>=open_url#getvisual()<CR><CR>
nnoremap <Plug>(open-url-wiki-search) :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>
vnoremap <Plug>(open-url-wiki-search) <Esc>:OpenURL http://www.google.com/search?q=<C-r>=open_url#getvisual()<CR><CR>
nnoremap <Plug>(open-url-google-search) :OpenURL http://www.google.com/search?q=<cword><CR>
vnoremap <Plug>(open-url-google-search) <Esc>:OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<C-r>=open_url#getvisual()<CR><CR>

if !hasmapto('<Plug>(open-url-browser)')
  nmap gB <Plug>(open-url-browser)
  vmap gB <Plug>(open-url-browser)
endif
if !hasmapto('<Plug>(open-url-wiki-search)')
  nmap gW <Plug>(open-url-wiki-search)
  vmap gW <Plug>(open-url-wiki-search)
endif
if !hasmapto('<Plug>(open-url-google-search)')
  nmap gG <Plug>(open-url-google-search)
  vmap gG <Plug>(open-url-google-search)
endif
