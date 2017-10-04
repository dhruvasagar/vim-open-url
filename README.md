# VIM Open Url v0.1

A VIM plugin to open urls in the default browser

This plugin aim's is to provide a cross platform API to open a url in your
default web browser.

## API

### VIM Command :

* `:OpenUrl <url>` to open given url in the default web browser

### VIM Default Mappings :

* <kbd>gB</kbd>: Open url under cursor in the default web browser
* <kbd>gG</kbd>: Google search word under cursor in the default web browser
* <kbd>gW</kbd>: Wiki search word under cursor in the default web browser

These mappings can be disabled with:
```vim
let g:open_url_set_default_mappings = 1
nnoremap <your mappings> :OpenURL <cfile><CR>
nnoremap <your mappings> :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap <your mappings> :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>
```

### VIM autoload function :

* `open_url#open(a:url)`: Open given url in the default web browser

## License

Copyright © Dhruva Sagar.  Distributed under the same terms as Vim itself.
See `:help license`.
