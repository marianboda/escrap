q = require 'q'
Datastore = require 'nedb'
db = {}
# db.vars = new Datastore {filename: './vars.nedb'}
db.posts = new Datastore {filename: './db.nedb'}
db.posts.loadDatabase()

class DataService
  getPosts: ->
    defer = q.defer()
    console.log 'a'
    db.posts.find {}, {content:0}, (err, docs) ->
      console.log 'b'
      defer.resolve docs

    defer.promise

module.exports = new DataService()
