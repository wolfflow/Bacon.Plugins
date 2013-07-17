init = (Bacon) ->
  Bacon.scheduleWithAbsolute = (t, value) -> 
    Bacon.later(t - Date.now(), value)

if module?
  Bacon = require("baconjs")
  module.exports = init(Bacon)
else
  if typeof require is "function"
    define "bacon-schedule", ["bacon"], init
  else
    init(this.Bacon)
