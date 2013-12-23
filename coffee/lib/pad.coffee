
module.exports = (n, size=2) ->
  while String(n).length < size
    n = '0' + n

  n
