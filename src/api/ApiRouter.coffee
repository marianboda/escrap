_ = require 'lodash'
request = require 'request'
cheerio = require 'cheerio'
apiRouter = require('express').Router()
siren = require '../services/SirensSound'

apiRouter.get '/', (req, res, next) ->
  res.send('inside api Router')

apiRouter.get '/posts', (req, res, next) ->
  siren.getPosts().then (data) ->
    res.json data

module.exports = apiRouter
