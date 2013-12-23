readdir = require 'recursive-readdir'
options = require './options'

module.exports = (server, callback) ->
  readdir options.routes, (err, files) ->
    throw new Error(err) if err

    for file in files
      if file.lastIndexOf('.coffee') is file.length - 7
        require(process.cwd() + '/' + file)(server)

    callback()
