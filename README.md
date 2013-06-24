node-parse-rss
---

parse rss feeds in url

wrapper of [feedparser](https://github.com/danmactough/node-feedparser)

##install

***using npm:***

    npm install parse-rss

****or using package.json:***

    "parse-rss": "*"

##usage
    # Coffeescript
    finder = require 'find-rss'
    finder "http://www.apple.com/",(candidates)->
      console.log candidates

      # =>
      # [ { rel: 'alternate',
            type: 'application/rss+xml',
            title: 'RSS',
            href: 'http://images.apple.com/main/rss/hotnews/hotnews.rss',
            url: 'http://images.apple.com/main/rss/hotnews/hotnews.rss' } ]
