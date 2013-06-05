Bacon.fromOnEvent = (target, eventName) ->
  Bacon.fromBinder (handler) ->
    target[eventName] = (args...) -> handler(args...)
    (-> target[eventName] = null)