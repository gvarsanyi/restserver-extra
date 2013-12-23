
module.exports.host      = 'localhost'
module.exports.port      = 80
module.exports.routes    = './routes'

module.exports.update = (overrides) ->
  (module.exports[k] = v) for k, v of overrides
