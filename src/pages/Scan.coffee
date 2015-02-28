React = require 'react'
Reflux = require 'reflux'
R = React.DOM

Actions = require '../actions'
postStore = require '../PostStore'

page = React.createClass
  displayName: 'ScanPage'
  mixins: [Reflux.ListenerMixin]
  componentDidMount: ->
    @listenTo postStore, -> @forceUpdate()

  scanButtonHandler: ->
    console.log 'button pressed'
    Actions.scan()

  render: ->
    console.log 'rendering scanning page'
    R.div {},
      R.p {}, 'text from Scan Page'
      R.button {onClick: @scanButtonHandler}, 'SCAN'
      # R.button({}, i) for i in [0..10]
      R.ul {},
        R.li {key: i.name}, i.name for i in postStore.posts

module.exports = page
