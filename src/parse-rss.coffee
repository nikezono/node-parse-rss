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

  request url, (error,res,body)->
    if error? or res?.statusCode isnt 200
      return callback "request:#{url}, Error:#{error}",null 
    else
      request(url).pipe(new FeedParser([options]))
      .on 'error', (error)->
        callback error,null
      .on 'readable', ->
        stream = this
        rss.push item  if item = stream.read()
      .on 'end', ->
        callback null,rss
      