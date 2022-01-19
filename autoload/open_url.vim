function! open_url#open(url)
  let url = escape(a:url, "%|*#")
  if has('win16') || has('win32') || has('win64')
    exe '!start cmd /cstart /b '.url.''
  elseif has('mac') || has('macunix') || has('gui_macvim')
    exe 'silent !open "'.url.'"'
  else
    exe 'silent! !'.g:open_url_browser_default.' "'.url.'" &> /dev/null &'
  endif
  redraw!
endfunction

function! open_url#open_in(app, file)
  if has('mac') || has('macunix') || has('gui_macvim')
    exec 'silent !open -a "'.a:app.'"' escape(a:file, '%|*#')
  endif
endfunction

function! open_url#get_selection()
  return getline('.')[col("'<")-1:col("'>")-1]
endfunction

function! open_url#find_url() abort
  let pat = 'http\(s\)\?'
  let url = expand('<cfile>')
  if url =~# pat | return url | endif

  let found = search(pat, '', line('.'))
  if found > 0 | return expand('<cfile>') | endif
endfunction
