React = require 'react'
R = React.DOM

page = React.createClass
  displayName: 'ScanPage'
  render: ->
    console.log 'rendering scanning page'
    R.div {},
      R.p {}, 'text from Scan Page'
      # R.button({}, i) for i in [0..10]

module.exports = page
