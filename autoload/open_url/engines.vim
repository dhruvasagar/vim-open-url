let g:open_url#engines#default = 'duckduckgo'

let s:engines = {
      \ 'google': 'https://www.google.com/search?q=%s',
      \ 'duckduckgo': 'https://duckduckgo.com/?q=%s',
      \ 'wikipedia': 'https://en.wikipedia.org/wiki/Special:Search?search=%s',
      \ 'so': 'https://stackoverflow.com/search?q=%s',
      \}

function! s:SearchURL(engine, term) abort
  let pattern = s:engines[g:open_url#engines#default]
  if index(keys(s:engines), a:engine) >= 0
    let pattern = s:engines[a:engine]
  endif
  return printf(pattern, a:term)
endfunction

function! open_url#engines#add(name, pattern) abort
  let s:engines[a:name] = a:pattern
endfunction

function! open_url#engines#complete(...) abort
  return join(keys(s:engines), "\n")
endfunction

function! open_url#engines#search(...) abort
  " If we supply only 1 argument it must be the search term and we should use
  " the default search engine to search for it
  let engine = a:0 > 1 ? a:1 : g:open_url#engines#default
  let term = a:0 > 1 ? a:2 : a:1
  let url = s:SearchURL(engine, term)
  call open_url#open(url)
endfunction
