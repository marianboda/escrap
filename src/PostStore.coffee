Reflux = require 'reflux'
Actions = require './actions'
request = require 'superagent'
he = require 'he'

store =
  posts: [{name: '---'}, {name: '--'}]
  selectedPostId: null
  selectedPost: {}

  getPost: (id) ->
    url = "/api/post/#{id}"
    request url, (err, res) =>
      return console.error(err) if err?
      post = JSON.parse res.text
      if @selectedPostId is post.id
        @selectedPost = post
        @trigger()

  getPosts: (page = 1) ->
    url = '/api/posts'
    url += "/#{page}" if page > 1
    request url, (err, res) =>
      @posts = JSON.parse(res.text)
      post.name = he.decode(post.name) for post in @posts

      @posts.forEach (i) ->
        old = i.name
        i.name = old.replace /\* \* \* \* \* \* \* \* \* \*\s*(.*)\s*\* \* \* \* \* \* \* \* \* \*/, '$1'
        return i.stars = 10 if old isnt i.name
        i.name = old.replace /\* \* \* \* \*\s*(.*)\s*\* \* \* \* \*/, '$1'
        return i.stars = 5 if old isnt i.name
        i.name = old.replace /\*\*\*\*\*\s*(.*)\s*\*\*\*\*\*/, '$1'
        return i.stars = 5 if old isnt i.name
        i.name = old.replace /\s*\* \* \* \*\s*(.*)\s*\* \* \* \*\s*/, '$1'
        return i.stars = 4 if old isnt i.name
        i.name = old.replace /\s*\* \* \*\s*(.*)\s*\* \* \*\s*/, '$1'
        return i.stars = 3 if old isnt i.name
        i.name = old.replace /\s*\* \*\s*(.*)\s*\* \*\s*/, '$1'
        return i.stars = 2 if old isnt i.name

      @trigger()

  init: ->
    @getPosts() if window?

    @listenTo Actions.scan, =>
      console.log 'scanning'
      @posts.push {name: 'this pushed ' + @posts.length}
      @getPosts()
      @trigger()

    @listenTo Actions.postSelected, (postId) =>
      console.log postId
      @selectedPostId = postId
      @getPost postId
      @trigger()

module.exports = Reflux.createStore store
