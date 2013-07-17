init = (Bacon, $) ->

  ajax = Bacon.ajax = (params, abort) -> 
    Bacon.fromPromise $.ajax(params), abort

  Bacon.ajaxGet = (url, data, dataType, abort) -> 
    ajax({url, dataType, data}, abort)       

  Bacon.ajaxGetJSON = (url, data, abort) -> 
    ajax({url, dataType: "json", data}, abort)         

  Bacon.ajaxPost = (url, data, dataType, abort) ->
    ajax({url, dataType, data, type: "POST"}, abort)

  Bacon.ajaxGetScript = (url, abort) -> 
    ajax({url, dataType: "script"}, abort)

  Bacon.EventStream::ajax = -> @flatMapLatest ajax

if module?
  Bacon = require("baconjs")
  $ = require("jquery")
  module.exports = init(Bacon, $)
else
  if typeof require is "function"
    define "bacon-ajax", ["bacon", "jquery"], init
  else
    init(this.Bacon, this.$)