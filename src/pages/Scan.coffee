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

  onItemClick: (event) ->
    console.log event.target.innerHTML
    # Actions.postSelected()

  render: ->
    console.log 'rendering scanning page'
    R.div {},
      R.p {}, 'text from Scan Page'
      R.button {onClick: @scanButtonHandler}, 'UPDATE'
      R.ul {className: 'postList'},
        R.li {key: i._id, onClick: @onItemClick}, i.name for i in postStore.posts

module.exports = page
