# abstract methods:
# #positions: returns an array of positions
# #reset: generates new positions
#
class App.TimeHashPositionStrategy

  @instance = null
  @singleton: ->
    @instance ?= new @

  constructor: ->
    @reset()

  reset: ->
    @hash = hex_md5(new Date().getMilliseconds().toString())

  positions: ->
    (@_getPosition(hexPair) for hexPair in @hash.match(/.{2}/g))

  _getPosition: (hexPair) ->
    parseInt(index, 16) for index in hexPair.split(//)
