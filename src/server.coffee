express = require 'express'
React = require 'react'
App = require './App'

R = React.DOM
app = express()
router = express.Router()

reactRouter = require 'react-router'

routes = require './routes'

port = process.env.PORT || 3002

router.get '/*', (req, res) ->
  reactRouter.run routes, req.path, (Handler) ->
    # console.log Handler, state
    # console.log req.path
    res.send React.renderToString(React.createElement(Handler, {path: req.path}))
    # React.render React.createElement(Handler, {params: state.params}), document

app.use '/static', express.static(__dirname + '/../static')
app.use '/favicon.ico', express.static(__dirname + '/../static/favicon.ico')
app.use '/api', require('./api/ApiRouter')
app.use '/', router

server = app.listen port, ->
  console.log 'App listening at %s : %s',
    server.address().address, server.address().port
