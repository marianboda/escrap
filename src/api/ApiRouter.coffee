_ = require 'lodash'
request = require 'request'
cheerio = require 'cheerio'
apiRouter = require('express').Router()
siren = require '../services/SirensSound'
DataService = require '../services/DataService'


apiRouter.get '/', (req, res, next) ->
  res.send('inside api Router')

apiRouter.get '/posts', (req, res, next) ->
  DataService.getPosts().then (data) ->
    res.json data

apiRouter.get '/post/:id', (req, res, next) ->
  res.json {} unless req.params.id?
  DataService.getPost(req.params.id).then (data) ->
    res.json data


apiRouter.get '/posts/:page', (req, res, next) ->
  page = req.params.page || 1
  siren.getPosts(page).then (data) ->
    res.json data

module.exports = apiRouter
