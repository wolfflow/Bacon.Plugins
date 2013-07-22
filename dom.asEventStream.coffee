init = (Bacon) ->
  HTMLElement::asEventStream = (eventName, eventTransformer) ->
    Bacon.fromEventTarget(@, eventName, eventTransformer)

if module?
  Bacon = require("baconjs")
  module.exports = init(Bacon)
else
  if typeof require is "function"
    define "bacon-dom-asEventStream", ["bacon"], init
  else
    init(this.Bacon)