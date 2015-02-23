_ = require 'lodash'
request = require 'request'
cheerio = require 'cheerio'
apiRouter = require('express').Router()

apiRouter.get '/', (req, res, next) ->
  res.send('inside api Router')

apiRouter.get '/posts', (req, res, next) ->
  url = 'http://www.thesirenssound.com/'
  request url, (err, response, html) ->
    a = []
    if !err
      $ = cheerio.load html

      posts = $('.post')
      console.log Object.keys(posts[0])
      console.log posts[0].children

      a = _.map posts, (i) ->
        post = {}
        post.id = i.attribs.id
        post.name = $('h2 a',i).html()
        post.link = $('h2 a',i).attr('href')
        post

      console.log a
    res.json(a)

module.exports = apiRouter
