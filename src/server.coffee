express = require 'express'
React = require 'react'
App = require './App'

R = React.DOM
app = express()
router = express.Router()

port = process.env.PORT || 3002

router.get '/*', (req, res) ->
  res.send React.renderToString React.createElement(App, {title: 'Escrap'})

router.get '/whatup', (req, res) ->
  a = Object.keys(req.query).map (i) -> "#{i} = #{req.query[i]}"
  res.send a.join "<br>\n"

app.use '/static', express.static(__dirname + '/../static')
app.use '/api', require('./api/ApiRouter')
app.use '/', router

server = app.listen port, ->
  console.log 'App listening at %s : %s',
    server.address().address, server.address().port
