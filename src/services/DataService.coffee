_ = require 'lodash'
q = require 'q'
SQLite = require 'sqlite3'
fs = require 'fs'
config = require '../config'
db = new SQLite.Database "#{config.DB_PATH}/db.sqlite"

class DataService
  getPosts: ->
    defer = q.defer()
    db.all 'SELECT * FROM posts', (err, docs) ->
      defer.resolve docs
    defer.promise

  getPost: (id) ->
    defer = q.defer()
    db.get 'SELECT * FROM posts WHERE id='+parseInt(id), (err, doc) ->
      defer.resolve doc
    defer.promise

module.exports = new DataService()
