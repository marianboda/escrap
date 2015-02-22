express = require 'express'
app = express()
React = require 'react'

rApp = React.createClass
  render: ->
    React.DOM.div {},
      React.DOM.h1 {}, 'app'
      React.DOM.p {}, 'some text'

app.get '/', (req, res) ->
  res.send('Hello World')

app.get '/whatup', (req, res) ->
  # a = Object.keys(req.query).map (i) -> "#{i} = #{req.query[i]}"
  # res.send a.join "<br>\n"

  res.send React.renderToString React.createElement(rApp)

server = app.listen 3002, ->
  host = server.address().address
  port = server.address().port

  console.log 'App listening at %s : %s', host, port
