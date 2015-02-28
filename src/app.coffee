React = require 'react'
R = React.DOM
Router = require 'react-router'
Route = Router.Route
Link = Router.Link

postStore = require './PostStore'

App = React.createClass
  displayName: 'App'
  render: ->

    R.html {},
      R.head {},
        R.script {src: 'static/js/bundle.js'}
        R.title {}, @props.title || '--'
      R.body {},
        R.div {},
          React.createElement Link, {to: 'scan'}, 'SCAN'
          R.span {}, ' '
          React.createElement Link, {to: 'data'}, 'DATA'
        React.createElement Router.RouteHandler, React.__spread({}, @props)

module.exports = App
