class Constellation
  
  attr_accessor :systems_list
  
  def initialize(name)
    @name = name
    @systems_list = []
  end
  
  def add_system(system)
    (system.class == SolarSystem) ? (@systems_list.push(system)) : (raise ArgumentError, "#{system} is not a valid solar system")
  end
  
  def list_systems()
    list = "List of systems in this constellation:"
    @systems_list.each_with_index do |solar_system, index|
      list << "\n#{index + 1}. #{solar_system.star_name + " System"}"
    end
    return list
  end
  
end