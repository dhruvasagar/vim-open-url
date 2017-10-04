function! open_url#getvisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&
  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')
  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save
  return selection
endfunction

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
