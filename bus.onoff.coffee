Bus = Bacon.Bus
Bus::on = (type) -> @filter (x) -> x.type is type
Bus::off = @end