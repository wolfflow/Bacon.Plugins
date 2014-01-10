init = (Bacon) ->
  Bus = Bacon.Bus
  Bus::on = (type) -> @filter (x) -> x.type is type
  Bus::off = @end

if module?
  Bacon = require("baconjs")
  module.exports = init(Bacon)
else
  if typeof define == "function" and define.amd
    define ["bacon"], init
  else
    init(this.Bacon)