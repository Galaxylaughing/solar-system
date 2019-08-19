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
  
  def find_planet_by_name(planet_name)
    found_planet = "No such planet found"
    
    planets_found = @planets.select do |planet_instance|
      planet_instance.name.downcase == planet_name.downcase
    end
    
    if planets_found.length == 1
      found_planet = planets_found[0]
    elsif planets_found.length > 1
      found_planet = "Multiple planets of that name were found. These were:"
      planets_found.each_with_index do |planet_instance, index|
        found_planet << "\n#{index + 1}. #{planet_instance}"
      end
    end
    
    return found_planet
  end
  
end
