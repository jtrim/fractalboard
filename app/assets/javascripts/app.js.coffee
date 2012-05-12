#= require_self
#= require 'md5'
#= require 'time_hash_position_strategy'
#= require 'boards_controller'
#= require 'board_schema'
#= require 'board'

class window.App

  constructor: ->
    schema = App.BoardSchema.singleton()
    positionStrategy = App.TimeHashPositionStrategy.singleton()
    controller = App.BoardsController.singleton(schema, positionStrategy)

window.onload = ->
  new App
