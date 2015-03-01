Reflux = require 'reflux'
Actions = require './actions'
request = require 'superagent'
he = require 'he'

store =
  posts: [{name: '---'}, {name: '--'}]

  getPosts: (page = 1) ->
    url = '/api/posts'
    url += "/#{page}" if page > 1
    # console.log request
    request url, (res) =>
      console.log JSON.parse(res.text)
      @posts = JSON.parse(res.text)
      post.name = he.decode(post.name) for post in @posts
      @trigger()
      # @posts = res

  init: ->
    @listenTo Actions.scan, =>
      console.log 'scanning'
      @posts.push {name: 'this pushed ' + @posts.length}
      @getPosts(2)
      @trigger()

module.exports = Reflux.createStore store
