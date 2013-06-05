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