// Generated by CoffeeScript 1.6.3
(function() {
  var options, readdir;

  readdir = require('recursive-readdir');

  options = require('./options');

  module.exports = function(server, callback) {
    return readdir(options.routes, function(err, files) {
      var file, _i, _len;
      if (err) {
        throw new Error(err);
      }
      for (_i = 0, _len = files.length; _i < _len; _i++) {
        file = files[_i];
        if (file.lastIndexOf('.coffee') === file.length - 7) {
          require(process.cwd() + '/' + file)(server);
        }
      }
      return callback();
    });
  };

}).call(this);
