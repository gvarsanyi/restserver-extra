
module.exports = (req, res, next, msg, status) ->
  if typeof next isnt 'function' or next is null
    status = msg
    msg    = next
    next   = null

  res.send status or 200, msg

  log = 'HTTP' + res.statusCode + ' ' + JSON.stringify(msg)

  req.__log.push(log).flush()

  next() if next
