function! open_url#open(url)
  if has('win16') || has('win32') || has('win64')
    exe "!start cmd /cstart /b ".a:url.""
  elseif has('mac') || has('macunix' || has('gui_macvim')
    exe "silent !open \"".a:url."\""
  else
    exe "silent !sensible-browser \"".a:url."\""
  endif
  redraw!
endfunction
