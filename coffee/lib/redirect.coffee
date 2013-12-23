
module.exports = (req, res, next, url) ->
  if typeof next isnt 'function' or next is null
    url  = next
    next = null

  res.redirect url

  ms = (new Date).getTime() - req.__log.t.getTime()
  req.__log.push('(' + ms + 'ms) ' + res.statusCode + ' ' + url).push()

  next() if next
