cp = require 'child_process'

task 'test','run tests', ->
    cp.spawn "./node_modules/.bin/mocha"
        ,[ "--compilers","coffee:coffee-script/register","./test/*.coffee","--reporter","spec"]
            ,{ stdio: 'inherit' }

task 'compile','compile automate', ->
  cp.spawn "./node_modules/.bin/coffee"
    , [ "-o", "./lib", "-cw", "-b", "./src"]
      ,{ stdio: 'inherit' }
