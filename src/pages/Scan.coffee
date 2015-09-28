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

  onItemClick: (target) ->
    Actions.postSelected(target)

  render: ->
    console.log 'rendering scanning page'
    contStyle =
      display: 'flex'
      flexDirection: 'column'

    postContent = if postStore.selectedPost?.content? then postStore.selectedPost.content else ''

    R.div {style: contStyle},
      R.p {}, 'text from Scan Page'
      R.div {},
        R.button {onClick: @scanButtonHandler}, 'UPDATE'
      R.div {style: {display: 'flex', flexDirection: 'row'}},
        R.ul {className: 'postList', style: {flexShrink: 0}},
          R.li {key: i._id, onClick: do => id = i.id; => @onItemClick(id)}, i.name for i in postStore.posts
        R.div {},
          R.div {dangerouslySetInnerHTML: {__html: postContent}}


module.exports = page
