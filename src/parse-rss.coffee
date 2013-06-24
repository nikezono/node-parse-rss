module.exports = (url,callback) ->

  # dependency
  FeedParser = require 'feedparser'
  request    = require 'request'


  # FeedParser Options
  options =
    normalize : false
    addmeta   : true
    feedurl   : url

  console.log "library loaded"

  rss = []

  request(url).pipe(new FeedParser([options])).on('error', (error)->
    console.error "url request error"
    console.error error
  ).on('readable', ->
    stream = this
    if item = stream.read()
      console.log "#{item.title} is added"
      rss.push item 

  ).on('end', ->
    console.log "finished. length: #{rss.length}"
    callback rss
  )