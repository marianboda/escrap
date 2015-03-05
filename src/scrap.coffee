async = require 'async'
sirens = require './services/SirensSound'

Datastore = require 'nedb'
db = {}
db.vars = new Datastore {filename: './vars.nedb'}
db.posts = new Datastore {filename: './db.nedb'}

db.posts.ensureIndex {fieldName: 'id', unique: true}
db.vars.ensureIndex {fieldName: 'var', unique: true}

# db.posts.loadDatabase (err) ->
#   return console.error err if err?
#   start()
#
# db.

page = 1

async.parallel [
  (cb) -> db.posts.loadDatabase cb
  (cb) -> db.vars.loadDatabase (err) ->
    db.vars.find {var: 'lastPageProcessed'}, (err, docs) ->
      if docs.length is 0
        db.vars.insert {var: 'lastPageProcessed', value: 1}, (err) ->
          cb err
      else
        cb err


], (err) ->
  console.log 'all done'
  start()

start = ->
  console.log 'starting.. page: ', page
  sirens.getPosts(page).then (data) ->
    db.posts.insert data, (err) ->
      console.error err if err?
      page++
      start()
