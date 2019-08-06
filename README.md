# VIM Open Url v0.4

A VIM plugin to open urls in the default browser

This plugin aim's is to provide a cross platform API to open a url in your
default web browser.

## API

### VIM Command :

* `:OpenURL <url>` to open given url in the default web browser

### VIM Mappings :

These work in both normal mode and visual mode :

* <kbd>gB</kbd>: Open url under cursor in the default web browser.
* <kbd>gG</kbd>: Google search word under cursor in the default web browser
* <kbd>gW</kbd>: Wiki search word under cursor in the default web browser

The following plug mappings are provided which can be remapped if you prefer
different mappings to those provided by default.

* `<Plug>(open-url-browser)`
* `<Plug>(open-url-wiki-search)`
* `<Plug>(open-url-google-search)`

### VIM Variables :
* `g:open_url_browser_default` changes default browser (Default: `xdg-open`)
* `g:open_url_default_mappings` enable/disable default mappings without
remapping `<Plug>` mappings (Default: `1`)

### VIM autoload function :

* `open_url#open(a:url)`: Open given url in the default web browser

## License

Copyright © Dhruva Sagar.  Distributed under the same terms as Vim itself.
See `:help license`.
