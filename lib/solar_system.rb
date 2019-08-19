# each instance of SolarSystem will keep track of a collection of instances of Planet.

class SolarSystem
  
  attr_reader :star_name, :planets
  
  def initialize(star_name:)
    @star_name = star_name
    @planets = []
  end
  
  def add_planet(planet)
    @planets.push(planet)
  end
  
end