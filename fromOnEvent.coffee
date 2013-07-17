init = (Bacon) ->
  Bacon.fromOnEvent = (target, eventName) ->
  Bacon.fromBinder (handler) ->
    target[eventName] = (args...) -> handler(args...)
    (-> target[eventName] = null)

if module?
  Bacon = require("baconjs")
  module.exports = init(Bacon)
else
  if typeof require is "function"
    define "bacon-from-onevent", ["bacon"], init
  else
    init(this.Bacon)