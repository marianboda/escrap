React = require 'react'
R = React.DOM

App = React.createClass
  render: ->
    R.html {},
      R.head {},
        R.title {}, @props.title || '--'
      R.body {},
        R.div {},
          R.a {href: '/scan'}, 'SCAN'
          R.h1 {}, @props.title
          R.p {}, 'some text'

module.exports = App
