init = (Bacon) ->
  HTMLElement::asEventStream = (eventName, eventTransformer) ->
    Bacon.fromEventTarget(@, eventName, eventTransformer)

if module?
  Bacon = require("baconjs")
  module.exports = init(Bacon)
else
  if typeof define == "function" and define.amd
    define ["bacon"], init
  else
    init(this.Bacon)