React = require 'react'
R = React.DOM

postStore = require './PostStore'

App = React.createClass
  render: ->
    R.html {},
      R.head {},
        R.script {src: 'static/js/bundle.js'}
        R.title {}, @props.title || '--'
      R.body {},
        R.div {},
          R.a {href: '/scan'}, 'SCAN'
          R.h1 {}, @props.title
          R.ul {},
            R.li {}, i.name for i in postStore.posts

module.exports = App
