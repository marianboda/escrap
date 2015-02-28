React = require 'react'
Router = require 'react-router'
routes = require '../routes'

Router.run routes, Router.HistoryLocation, (Handler) ->
  React.render(React.createElement(Handler, {path: window.location.pathname}), document)
