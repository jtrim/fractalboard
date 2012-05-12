# TODO:
# Board severly needs an update. We pulled out some responsibilities and
# left the board in a non functional state.
#
# need to pass the bounds into the constructor
# bounds needs to be an object that responds to width, height
#
class App.Board

  constructor: (bounds, context) ->
    @bounds = bounds
    @context = context

  draw: (strategy) ->
    @colorSquare position for position in strategy.positions()

  colorSquare: (position) ->
    @context.fillStyle = '#000000'

    [xIndex, yIndex] = position

    x = Math.floor(@bounds.width / 16 * xIndex)
    y = Math.floor(@bounds.height / 16 * yIndex)

    width = Math.floor(@bounds.width / 16)
    height = Math.floor(@bounds.height / 16)

    @context.fillRect(x, y, width, height)
