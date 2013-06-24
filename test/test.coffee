# test dependency
path = require 'path'
assert  = require 'assert'

# test framework
parser = require path.resolve('lib','parse-rss')

apple    = "http://images.apple.com/main/rss/hotnews/hotnews.rss"
livedoor = "http://news.livedoor.com/topics/rss/trend.xml"
geta6    = "http://blog.geta6.net/rss"

describe "Parse", ->
  it "Parseできる", (done)->
    parser apple,(rss)->\
      done()  if rss[0].title?
      