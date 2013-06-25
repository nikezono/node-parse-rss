node-parse-rss
---
[![Build Status](https://travis-ci.org/nikezono/node-parse-rss.png)](https://travis-ci.org/nikezono/node-parse-rss)

parse rss feeds in url

wrapper of [feedparser](https://github.com/danmactough/node-feedparser)

##install

***using npm:***

    npm install parse-rss

****or using package.json:***

    "parse-rss": "*"

##usage
    # Coffeescript
    parser = require 'parse-rss'
    parser "http://images.apple.com/main/rss/hotnews/hotnews.rss",(rss)->
      console.log rss

      # =>
      # [ { title: 'Apple Launch new iPad...',
            description: 'application/rss+xml',
            meta: [Object],
          },{
            title:...
            description:...
            },{}...]

