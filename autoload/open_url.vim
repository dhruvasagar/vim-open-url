function! open_url#open(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif has("unix")
    if system("uname -s") =~? "darwin"
      echom 'osx'
      exe "silent !open \"".a:url."\""
    else
      exe "silent !sensible-browser \"".a:url."\""
    endif
  endif
  redraw!
endfunction
