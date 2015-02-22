React = require 'react'
R = React.DOM

App = React.createClass
  render: ->
    R.html {},
      R.head {},
        R.title {}, 'Scrap'
      R.body {},
        R.div {},
          R.h1 {}, 'This is a React component rendered on server'
          R.p {}, 'some text'

module.exports = App
