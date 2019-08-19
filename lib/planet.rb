# each instance of `Planet` will track data about a single planet.
class Planet
  
  attr_reader :name, :color, :mass_kg, :distance_from_sun_km, :fun_fact
  
  def initialize(name, color, mass_kg:, distance_from_sun_km:, fun_fact:)
    @name = name
    @color = color
    @mass_kg = mass_kg
    @distance_from_sun_km = distance_from_sun_km
    @fun_fact = fun_fact
  end
  
  def summary
    return "#{@name} is a #{@color} planet #{@distance_from_sun_km} km from the sun. It has a mass of #{@mass_kg} kg. Fun fact, #{@name} is #{@fun_fact}."
  end
  
end
