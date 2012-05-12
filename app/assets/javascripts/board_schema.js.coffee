class App.BoardSchema

  @instance = null
  @singleton: ->
    @instance ?= new @

  constructor: ->
    @reset()

  reset: ->
    @layout = ((0 for i in [0..15]) for index in [0..15])

  place: (position) ->
    @layout[position[0]][position[1]] = 1
