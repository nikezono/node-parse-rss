# test dependency
path = require 'path'
assert  = require 'assert'

# test framework
parser = require path.resolve('lib','parse-rss')

apple    = "http://images.apple.com/main/rss/hotnews/hotnews.rss" 
shokai    = "http://shokai.org/blog/feed"

describe "Parse", ->
  it "Parseできる", (done)->
    parser apple, (err,rss) ->
      done()  if rss[0].title?
      
  it "AtomがParseできる", (done) ->
    parser shokai, (err,rss) ->
      done() if rss[0].title?

  it "エラーハンドリングが行われる", (done)->
    parser "hogehoge", (err,rss)->
      done() if err?
      