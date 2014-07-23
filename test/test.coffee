# test dependency
path = require 'path'
assert  = require 'assert'

# test framework
parser = require '../lib/parse-rss'

apple    = "http://images.apple.com/main/rss/hotnews/hotnews.rss"
shokai    = "http://shokai.org/blog/feed"

describe "Parse", ->

  it "Parseできる", (done) ->
    @timeout 5000
    parser apple, (err,rss) ->
      assert.equal err, null
      assert.equal typeof rss[0].title, "string"
      done()

  it "AtomがParseできる", (done) ->
    @timeout 5000
    parser shokai, (err,rss) ->
      assert.equal err, null
      assert.equal typeof rss[0].title, "string"
      done()

  it "エラーハンドリングが行われる", (done) ->
    parser "hogehoge", (err,rss)->
      assert.ok err?
      done()
