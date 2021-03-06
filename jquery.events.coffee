init = (Bacon, $) ->
  $.fn.extend
    keydownE: (args...) -> @asEventStream "keydown", args...
    keyupE: (args...) -> @asEventStream "keyup", args...
    keypressE: (args...) -> @asEventStream "keypress", args...

    clickE: (args...) -> @asEventStream "click", args... 
    dblclickE: (args...) -> @asEventStream "dblclick", args... 
    mousedownE: (args...) -> @asEventStream "mousedown", args... 
    mouseupE: (args...) -> @asEventStream "mouseup", args...

    mouseenterE: (args...) -> @asEventStream "mouseenter", args...
    mouseleaveE: (args...) -> @asEventStream "mouseleave", args...
    mousemoveE: (args...) -> @asEventStream "mousemove", args...
    mouseoutE: (args...) -> @asEventStream "mouseout", args...
    mouseoverE: (args...) -> @asEventStream "mouseover", args...

    resizeE: (args...) -> @asEventStream "resize", args...
    scrollE: (args...) -> @asEventStream "scroll", args...
    selectE: (args...) -> @asEventStream "select", args...
    changeE: (args...) -> @asEventStream "change", args...

    submitE: (args...) -> @asEventStream "submit", args...
    
    blurE: (args...) -> @asEventStream "blur", args...
    focusE: (args...) -> @asEventStream "focus", args...
    focusinE: (args...) -> @asEventStream "focusin", args...
    focusoutE: (args...) -> @asEventStream "focusout", args...

    loadE: (args...) -> @asEventStream "load", args...
    unloadE: (args...) -> @asEventStream "unload", args...

if module?
  Bacon = require("baconjs")
  $ = require("jquery")
  module.exports = init(Bacon, $)
else
  if typeof define == "function" and define.amd
    define ["bacon", "jquery"], init
  else
    init(this.Bacon, this.$)