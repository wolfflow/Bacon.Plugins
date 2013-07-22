init = (Bacon, $) ->
  fromPromise = Bacon.fromPromise

  $.fn.extend
    animateE: (args...) -> fromPromise @animate(args...).promise()
    showE: (args...) -> fromPromise @show(args...).promise()
    hideE: (args...)-> fromPromise @hide(args...).promise()
    toggleE: (args...) -> fromPromise @toggle(args...).promise()

    fadeInE: (args...) -> fromPromise @fadeIn(args...).promise()
    fadeOutE: (args...) -> fromPromise @fadeOut(args...).promise()
    fadeToE: (args...) -> fromPromise @fadeTo(args...).promise()
    fadeToggleE: (args...) -> fromPromise @fadeToggle(args...).promise()

    slideDownE: (args...) -> fromPromise @slideDown(args...).promise()
    slideUpE: (args...) -> fromPromise @slideUp(args...).promise()
    slideToggleE: (args...) -> fromPromise @slideToggle(args...).promise()

if module?
  Bacon = require("baconjs")
  $ = require("jquery")
  module.exports = init(Bacon, $)
else
  if typeof require is "function"
    define "bacon-jquery-fx", ["bacon", "jquery"], init
  else
    init(this.Bacon, this.$)