class App.BoardsController

  @instance = null
  @singleton: (schema) ->
    @instance ?= new @(schema)

  constructor: (schema, strategy) ->
    @canvas = document.getElementById('fractal-board')
    @context = @canvas.getContext('2d')

    @schema = schema
    @strategy = strategy
    @board = new App.Board @context

    setInterval =>
      @tick()
    , 1000

  sizeCanvas: =>
    x = document.documentElement.clientWidth - 8
    y = document.documentElement.clientHeight - 20
    @canvas.setAttribute('width', x)
    @canvas.setAttribute('height', y)

  tick: ->
    @schema.place(position) for position in @strategy.positions()

    @context.clearRect(0, 0, @canvas.width, @canvas.height)
    @board.draw @strategy

    @schema.reset()
    @strategy.reset()
