init = (Bacon) ->
  cancelRequestAnimFrame = do ->
      window.cancelAnimationFrame or
      window.webkitCancelRequestAnimationFrame or
      window.mozCancelRequestAnimationFrame or
      window.oCancelRequestAnimationFrame or
      window.msCancelRequestAnimationFrame or
      clearTimeout

  requestAnimFrame = do ->
    window.requestAnimationFrame or
    window.webkitRequestAnimationFrame or
    window.mozRequestAnimationFrame or
    window.oRequestAnimationFrame or
    window.msRequestAnimationFrame or
    (cb) -> setTimeout(cb, 1000 / 60)
   
   
  scheduleFrame = (cb) ->
    id = -1
    animLoop = (x) -> 
      cb(x)
      id = requestAnimFrame(-> animLoop(id))
   
    animLoop(id)    
   
  Bacon.scheduleAnimFrame = ->
    Bacon.fromBinder (handler) ->
      id = scheduleFrame(handler)
      ->  cancelRequestAnimFrame(id)
    

  Bacon.repeatedlyOnFrame = (values, divisor = 1) ->
    index = 0
    Bacon.scheduleAnimFrame()
    .scan(0, (x) -> x + 1)
    .filter((tick) -> !(tick % divisor))
    .map(-> values[index++ % values.length])
    .toEventStream()

if module?
  Bacon = require("baconjs")
  module.exports = init(Bacon)
else
  if typeof define == "function" and define.amd
    define ["bacon"], init
  else
    init(this.Bacon)
