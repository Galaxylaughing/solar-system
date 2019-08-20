require_relative 'solar_system'

class User
  
  attr_accessor :location
  
  def initialize(location)
    (location.class == SolarSystem) ? (@location = location) : (raise ArgumentError, "#{location} is not a valid solar system")
  end
  
  def switch_systems(new_system)
    (new_system.class == SolarSystem) ? (@location = new_system) : (raise ArgumentError, "#{new_system} is not a valid solar system")
  end
  
end