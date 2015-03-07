q = require 'q'
Datastore = require 'nedb'
db = {}
# db.vars = new Datastore {filename: './vars.nedb'}
db.posts = new Datastore {filename: './db.nedb'}
db.posts.loadDatabase()

class DataService
  getPosts: ->
    defer = q.defer()
    db.posts.find {}, {content:0}, (err, docs) ->
      defer.resolve docs
    defer.promise

  getPost: (id) ->
    defer = q.defer()
    db.posts.findOne {_id: id}, (err, doc) -> defer.resolve doc ? {}
    defer.promise

module.exports = new DataService()
