# each instance of `Planet` will track data about a single planet.
class Planet
  
  attr_reader :name, :color, :mass_kg, :distance_from_sun_km, :fun_fact
  
  def initialize(name, color, mass_kg:, distance_from_sun_km:, fun_fact: "there are no fun facts for this planet")
    @name = name
    @color = color
    (mass_kg > 0) ? (@mass_kg = mass_kg) : (raise ArgumentError, "Given insufficient mass value")
    (distance_from_sun_km > 0) ? (@distance_from_sun_km = distance_from_sun_km) : (raise ArgumentError, "Given insufficient distance value")
    @fun_fact = fun_fact
  end
  
  def summary
    return "#{@name} is a #{@color} planet #{@distance_from_sun_km} km from the sun. It has a mass of #{@mass_kg} kg. Fun fact about #{@name}: #{@fun_fact}."
  end
  
end
