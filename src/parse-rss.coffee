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

  domain = require('domain').create()
  domain.on 'error',(e)->
    return callback e,null
  domain.run ->

    ### Module Initialize ###
    req = request url
    feedParser = new FeedParser([options])

    ### REQUEST ###
    req.on 'error',(err)->
      return callback err,null

    req.on 'response',(res)->
      stream = this

      if res.statusCode != 200
        return this.emit('error', new Error('Bad status code'))

      stream.pipe feedParser

    ### FEEDPARSER ###
    feedParser.on 'error', (err)->
      return callback err,null

    feedParser.on 'readable', ->
      stream = this
      if item = stream.read()
        rss.push item
    feedParser.on 'end', ->
      if rss.length is 0
        return callback 'no articles'
      return callback null, rss

