
config.load_autoconfig()
config.bind('<Ctrl-Shift-y>', 'hint links spawn --detach mpv --force-window yes {hint-url}')

search_engine = 'www.startpage.com'
c.url.default_page = search_engine
c.url.start_pages = [search_engine]
