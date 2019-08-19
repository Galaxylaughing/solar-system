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
  
  def list_planets()
    planet_list = "Planets orbiting #{@star_name}"
    
    @planets.each_with_index do |planet_instance, index|
      planet_list << "\n#{index + 1}. #{planet_instance.name}"
    end
    
    return planet_list
  end
  
end
