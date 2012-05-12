class App.BoardsController

  @instance = null
  @singleton: ->
    @instance ?= new @(arguments)

  constructor: ->
    [@schema, @strategy] = arg for arg in arguments

    @canvas = document.getElementById('fractal-board')
    @context = @canvas.getContext('2d')

    @sizeCanvas()
    canvasBounds = {
      width:  document.documentElement.clientWidth,
      height: document.documentElement.clientHeight
    }
    @board = new App.Board canvasBounds, @context

    setInterval =>
      @tick()
    , 1000

  sizeCanvas: =>
    x = document.documentElement.clientWidth - 8
    y = document.documentElement.clientHeight - 20
    @canvas.setAttribute('width', x)
    @canvas.setAttribute('height', y)

  tick: ->
    # populate the schema, based on our current positioning strategy
    @schema.place(position) for position in @strategy.positions()

    # clear the canvas
    @context.clearRect(0, 0, @canvas.width, @canvas.height)

    # draw the board based on our current positioning strategy
    @board.draw @strategy

    # reset the schema & strategy
    @schema.reset()
    @strategy.reset()
