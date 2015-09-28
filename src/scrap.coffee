async = require 'async'
sirens = require './services/SirensSound'
config = require './config'

Datastore = require 'nedb'
SQLite = require 'sqlite3'
db = new SQLite.Database "#{config.DB_PATH}/db.sqlite"

# setVar = (name, value) ->
#   db.run "UPDATE vars SET value='#{value}' WHERE var='#{name}'"

page = 1

cols = [
  'id'
  'name'
  'link'
  'content'
]

start = ->
  console.log 'starting.. page: ', page
  sirens.getPosts(page).then (data) ->
    return if data.length is 0

    valuesSet = data.map(
      (post) ->
        postString = cols.map(
          (key) -> if key is 'id' then (post.id).replace('post-','') else "'#{post[key].replace("'", "''")}'"
        ).join(', ')
        "(#{postString})"
    ).join(', ')

    db.run "INSERT INTO posts (#{cols.join(',')}) VALUES #{valuesSet}", (err) ->
      console.error err if err?
      page++
      # setVar 'lastPageProcessed', page
      console.log "records: #{data.length}"
      setTimeout( start, 1)

start()
