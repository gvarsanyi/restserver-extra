restify  = require 'restify'
log_init = require './log_init'
options  = require './options'
routes   = require './routes'

module.exports = (overrides, callback) ->
  if not callback?
    callback = overrides
  else if typeof overrides is 'object'
    options.update overrides

  server = restify.createServer()

  server.use restify.acceptParser server.acceptable
  server.use restify.queryParser()
  server.use restify.bodyParser()
  server.use log_init

  server.pre (req, res, next) ->
    req.headers.accept = 'application/json'
    next()

  routes server, ->
    server.listen options.port, options.host, ->
      console.log 'listening @ ' + options.host + ':' + options.port
      callback() if typeof callback is 'function'
