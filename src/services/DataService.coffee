_ = require 'lodash'
q = require 'q'
Datastore = require 'nedb'
db = {}
# db.vars = new Datastore {filename: './vars.nedb'}
db.posts = new Datastore {filename: './../db.nedb'}
db.posts.loadDatabase()

class DataService
  getPosts: ->
    defer = q.defer()
    db.posts.find({}).projection({content:0}).exec (err, docs) ->
      docs.forEach (i) ->
        i.id = parseInt i.id.replace('post-', '')

      docs = _.sortBy(docs, 'id').reverse()
      defer.resolve docs
    defer.promise

  getPost: (id) ->
    defer = q.defer()
    db.posts.findOne {_id: id}, (err, doc) -> defer.resolve doc ? {}
    defer.promise

module.exports = new DataService()
