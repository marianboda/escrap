React = require 'react'
R = React.DOM
postStore = require '../PostStore'

page = React.createClass
  displayName: 'DataPage'
  render: ->
    console.log 'rendering data page'
    R.div {},
      R.ul {},
        R.li {key: i.name}, i.name for i in postStore.posts

module.exports = page
