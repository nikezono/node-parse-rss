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

  req = request url, (err, res, body) ->
    if err or res?.statusCode isnt 200
      return callback "request:#{url}, Error:#{error}"

    req.pipe(new FeedParser([options]))
    .on 'error', (err)->
      callback err
    .on 'readable', ->
      stream = this
      if item = stream.read()
        rss.push item
    .on 'end', ->
      if rss.length is 0
        return callback 'no articles'
      callback null, rss

