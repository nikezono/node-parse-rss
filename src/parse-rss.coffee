module.exports = (url,callback) ->

  # dependency
  FeedParser = require 'feedparser'
  request    = require 'request'


  # FeedParser Options
  options =
    normalize : false
    addmeta   : true
    feedurl   : url

  rss = []

  request(url).pipe(new FeedParser([options])).on('error', (error)->
    console.error "url request error"
    console.error error
  ).on('readable', ->
    stream = this
    rss.push item  if item = stream.read()
  ).on('end', ->
    callback rss
  )