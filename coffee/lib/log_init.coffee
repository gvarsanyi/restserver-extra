Log = require './log'

module.exports = (req, res, next) ->
  log = new Log(true)

  params = ''
  if req.body?
    for own k, v of req.body
      params = JSON.stringify(req.body)
      break

  log.push req.method + ' ' + req.url + ' ' + params

  req.__log = log

  next()
