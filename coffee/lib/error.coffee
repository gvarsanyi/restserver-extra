send = require './send'

module.exports = (req, res, next, msg, status) ->
  if typeof next isnt 'function'
    status = msg
    msg    = next
    next   = null

  if msg
    if msg.toString and typeof msg isnt 'string'
      msg = {error: msg.toString()}
    else
      msg = {error: msg}
  else
    msg = {error: true}

  if next
    send req, res, next, msg, status or 400
  else
    send req, res, msg, status or 400
