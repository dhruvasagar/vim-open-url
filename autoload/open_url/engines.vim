let g:open_url#engines#default = 'duckduckgo'

let s:engines = {
      \ 'google': 'https://www.google.com/search?q=%s',
      \ 'duckduckgo': 'https://duckduckgo.com/?q=%s',
      \ 'wikipedia': 'https://en.wikipedia.org/wiki/Special:Search?search=%s',
      \ 'so': 'https://stackoverflow.com/search?q=%s',
      \}

function! s:JoinTerms(terms) abort
  return join(a:terms, '%20')
endfunction

function! s:SearchURL(engine, terms) abort
  let pattern = s:engines[g:open_url#engines#default]
  if index(keys(s:engines), a:engine) >= 0
    let pattern = s:engines[a:engine]
  endif
  return printf(pattern, s:JoinTerms(a:terms))
endfunction

function! open_url#engines#add(name, pattern) abort
  let s:engines[a:name] = a:pattern
endfunction

function! open_url#engines#complete(...) abort
  return join(keys(s:engines), "\n")
endfunction

function! open_url#engines#search(...) abort
  if a:0 == 0 | return | endif

  let engine = a:1
  let terms = a:000[1:]

  " If we supply only 1 argument it must be the search term and we should use
  " the default search engine to search for provided terms
  if index(keys(s:engines), engine) == -1
    let engine = g:open_url#engines#default
    let terms = a:000
  endif

  let url = s:SearchURL(engine, terms)
  call open_url#open(url)
endfunction
