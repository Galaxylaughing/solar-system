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
  
  def find_system_by_name(star_name)
    found_system = "No such system found"
    
    systems_found = @systems_list.select do |system_instance|
      system_instance.star_name.downcase == star_name.downcase
    end
    
    if systems_found.length == 1
      found_system = systems_found[0]
    elsif systems_found.length > 1
      found_system = "Multiple systems with that star were found. These were:"
      systems_found.each_with_index do |system_instance, index|
        found_system << "\n#{index + 1}. #{system_instance}"
      end
    end
    
    return found_system
  end
  
end