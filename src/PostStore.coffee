Reflux = require 'reflux'
Actions = require './actions'

store =
  posts: [{name: '::)--'}, {name: 'somenome'}]
  init: ->
    @listenTo Actions.scan, =>
      console.log 'scanning'
      @posts.push {name: 'this pushed ' + @posts.length}
      @trigger()

module.exports = Reflux.createStore store
