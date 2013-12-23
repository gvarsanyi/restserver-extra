pad        = require './pad'
str_repeat = require './str_repeat'
timestamp  = require './timestamp'
tz_offset  = require './timezone_offset'

increment_id = 0

class Log
  constructor: (@threaded = false) ->
    increment_id += 1

    @id      = increment_id
    @t       = new Date
    @lines   = []
    @lines_t = []

    stamp = timestamp(@t) + '.' + pad(@t.getMilliseconds(), 3) + tz_offset(@t)

    @header = stamp + ' [' + @id + '] '
    @spc = str_repeat(' ', @header.length)

  push: (msg) ->
    t_diff = @get_t_diff()
    @lines_t.push t_diff
    @lines.push msg

    if not @threaded
      header = @header
      if @lines.length isnt 1
        header = '+' + t_diff + 'ms [' + @id + '] '
        header = @spc.substr(0, @spc.length - header.length) + header

      console.log header + msg
    @

  flush: ->
    if @threaded
      if @lines.length
        console.log @header + @lines[0]
        @lines.shift()
        @lines_t.shift()

        while @lines.length
          line = @lines.shift()
          t = @lines_t.shift()
          pre = '                   ' + String(t) + 'ms'

          console.log pre.substr(pre.length - 8) + ' . ' + line
    @

  get_t_diff: ->
    (new Date).getTime() - @t.getTime()

module.exports = Log
