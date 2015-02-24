_ = require 'lodash'
request = require 'request'
cheerio = require 'cheerio'
apiRouter = require('express').Router()
q = require 'q'

console.log 'is'

class SirensSound
  getPosts: (page = 1) ->
    url = 'http://www.thesirenssound.com/'
    defer = q.defer()

    if page > 1
      url += "page/#{page}/"
    console.log 'somethin'
    request url, (err, response, html) ->

      a = []
      if !err
        $ = cheerio.load html

        posts = $('.post')
        a = _.map posts, (i) ->
          post = {}
          post.id = i.attribs.id
          post.name = $('h2 a',i).html()
          post.link = $('h2 a',i).attr('href')
          post
        defer.resolve a
      defer.reject err

    defer.promise

module.exports = new SirensSound()
