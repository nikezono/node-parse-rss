node-parse-rss
[![Build Status](https://travis-ci.org/nikezono/node-parse-rss.png)](https://travis-ci.org/nikezono/node-parse-rss)

---

[![NPM](https://nodei.co/npm/parse-rss.png)](https://nodei.co/npm/parse-rss/)

rss feed parser

wrapper of [feedparser](https://github.com/danmactough/node-feedparser)

##install

***using npm:***

    npm install parse-rss

****or using package.json:***

    "parse-rss": "*"

##usage
    # Coffeescript
    parser = require 'parse-rss'
    url    = "http://images.apple.com/main/rss/hotnews/hotnews.rss"
    parser url, (err,rss)->
      console.log err if err
      console.log rss

      # =>
      # [ { title: 'Apple Launch new iPad...',
            description: 'application/rss+xml',
            meta: [Object],
          },{
            title:...
            description:...
            },{}...]

