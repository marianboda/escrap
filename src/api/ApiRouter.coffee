apiRouter = require('express').Router()

apiRouter.get '/', (req, res, next) ->
  res.send('inside api Router')

apiRouter.get '/posts', (req, res, next) ->
  res.send('listing posts')

module.exports = apiRouter
