class Animal
  constructor: (name) ->
    @name = name
    
  set_name: (name) ->
    @name = name
    
  get_name: ->
    return @name

module.exports = (robot) ->
  robot.hear /@test$/i, (msg) ->
    animal = new Animal "a"
    console.log animal.get_name()

    animal.set_name "b"
    console.log animal.get_name()