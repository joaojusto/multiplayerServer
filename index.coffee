express = require 'express'

app = express()
ExpressPeerServer = require('peer').ExpressPeerServer

app.get '/', (req, res, next) ->
  res.send 'Hello world!'

server = app.listen 9000

options =
    debug: true

app.use '/api', ExpressPeerServer server, options

server.on 'connection', (id) ->
  console.log 'connected with id: ' + id

server.on 'disconnect', (id) ->
  console.log 'disconnected id: ' + id
