express = require 'express'
app = express()
React = require 'react'
R = React.DOM

rApp = React.createClass
  render: ->
    R.html {},
      R.head {},
        R.title {}, 'Scrap'
      R.body {},
        R.div {},
          R.h1 {}, 'This is a React component rendered on server'
          R.p {}, 'some text'

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
