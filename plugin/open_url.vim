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
call s:SetGlobalOpt('open_url_set_default_mappings', 1)

command! -nargs=1 OpenURL call open_url#open(<q-args>)
command! -nargs=+ -complete=file OpenIn call open_url#open_in(<f-args>)
command! -nargs=1 -complete=file OpenInChrome OpenIn Google\ Chrome <q-args>

if exists('open_url_set_default_mappings')
	nnoremap gB :OpenURL <cfile><CR>
	nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
	nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>
endif
