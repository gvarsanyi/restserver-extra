
double_digit = (str) ->
  str = '0' + str if str < 10
  str

module.exports = (date = new Date) ->
  m = double_digit date.getMonth() + 1
  d = double_digit date.getDate()
  h = double_digit date.getHours()
  i = double_digit date.getMinutes()
  s = double_digit date.getSeconds()

  date.getFullYear() + '-' + m + '-' + d + ' ' + h + ':' + i + ':' + s
