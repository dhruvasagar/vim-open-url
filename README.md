# VIM Open Url v0.5.2

A VIM plugin to open urls in the default browser

This plugin aim's is to provide a cross platform API to open a url in your
default web browser.

## API

### VIM Command :

* `:OpenURL <url>` to open given url in the default web browser
* `:OpenIn <browser> <url>` to open given url in the specified web browser
* `:OpenSearchURL <engine> <url>` to open given url using registered search
  engine.
  > The default search engine is `duckduckgo`
  > However, `google`, `stackoverflow` and `wikipedia` are also available. You
  > can change the default by setting `g:open_url#engines#default`.
  >
  > Search engines can be added using the API `open_url#engines#add(name, pattern)`
  > where name is a logical name and pattern is a string that represents the
  > search url pattern, use `%s` as a placeholder for where the search term is
  > added.

### VIM Mappings :

These work in both normal mode and visual mode :

* <kbd>gB</kbd>: Open url under cursor in the default web browser.
* <kbd>g&lt;CR&gt;</kbd>: Search word under cursor using default search engine
* <kbd>gG</kbd>: Google search word under cursor in the default web browser
* <kbd>gW</kbd>: Wikipedia search word under cursor in the default web browser

The following plug mappings are provided which can be remapped if you prefer
different mappings to those provided by default.

* `<Plug>(open-url-browser)`
* `<Plug>(open-url-search)`
* `<Plug>(open-url-search-so)`
* `<Plug>(open-url-search-google)`
* `<Plug>(open-url-search-wikipedia)`

### VIM Variables :
* `g:open_url_browser_default` changes default browser (Default: `xdg-open`)
* `g:open_url_default_mappings` enable/disable default mappings without
remapping `<Plug>` mappings (Default: `1`)

### VIM autoload function :

* `open_url#open(url)`: Open given url in the default web browser
* `open_url#open_in(app, file)`: Open url in specified application (only
  supported on mac osx).
* `open_url#engines#add(name, patter)`: Add a search engine to the list of
  existing search engines
* `open_url#engines#search(engine, term)`: Search for given `term` using
  search engine named `engine`

## License

Copyright © Dhruva Sagar.  Distributed under the same terms as Vim itself.
See `:help license`.
