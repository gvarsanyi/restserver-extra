pad = require './pad'

module.exports = (date = new Date) ->
  offset = date.getTimezoneOffset()

  (if offset > 0 then '-' else '+') +
  pad(Math.abs(offset) / 60) + ':' +
  pad(Math.abs(offset) % 60)
