function! open_url#open(url)
  if has('win16') || has('win32') || has('win64')
    exe '!start cmd /cstart /b '.a:url.''
  elseif has('mac') || has('macunix') || has('gui_macvim')
    exe 'silent !open "'.a:url.'"'
  else
    exe 'silent !'.g:open_url_browser_default a:url
  endif
  redraw!
endfunction

function! open_url#open_in(app, file)
  if has('mac') || has('macunix') || has('gui_macvim')
    exec 'silent !open -a "'.a:app.'"' a:file
  endif
endfunction

function! open_url#get_selection()
  return getline('.')[col("'<")-1:col("'>")-1]
endfunction
