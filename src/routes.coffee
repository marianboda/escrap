React = require 'react'
Router = require 'react-router'
Route = Router.Route

postStore = require './PostStore'
scanPage = require './pages/Scan'
dataPage = require './pages/Data'
App = require './App'

module.exports = React.createElement Route, {name: 'app', path: '/', handler: App, location: 'history'},
  React.createElement Route,
    name: 'scan'
    path: '/scan'
    handler: scanPage
    key: 'scanPage'
  React.createElement Route,
    name: 'data'
    path: '/data'
    handler: dataPage
    key: 'dataPage'
