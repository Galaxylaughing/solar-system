require_relative "planet.rb"
require_relative "solar_system"

########## WAVE 1 and WAVE 2 CODE
def main()
  solar_system = SolarSystem.new(star_name: "Sol")
  
  earth = Planet.new("Earth", "blue-green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "Only planet known to support life")
  mars = Planet.new("Mars", "red", mass_kg: 6.39e23, distance_from_sun_km: 227900000, fun_fact: "Technically a cold desert world")
  jupiter = Planet.new("Jupiter", "stripey orange and white", mass_kg: 1.898e27, distance_from_sun_km: 778500000, fun_fact: "Twice as massive as all the other planets combined")
  neptune = Planet.new("Neptune", "blue with a dark blue eye", mass_kg: 1.024e26, distance_from_sun_km: 4495000000, fun_fact: "Only planet in the solar system not visible to the naked eye")
  
  solar_system.add_planet(earth)
  solar_system.add_planet(mars)
  solar_system.add_planet(jupiter)
  solar_system.add_planet(neptune)
  
  list = solar_system.list_planets
  puts list
  
  found_planet = solar_system.find_planet_by_name("jUPitEr")
  puts found_planet
  puts found_planet.summary
  
end


########## WAVE 3 CODE

our_solar_system = SolarSystem.new(star_name: "Sol")

earth = Planet.new("Earth", "blue-green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "Only planet known to support life")
mars = Planet.new("Mars", "red", mass_kg: 6.39e23, distance_from_sun_km: 227900000, fun_fact: "Technically a cold desert world")
jupiter = Planet.new("Jupiter", "stripey orange and white", mass_kg: 1.898e27, distance_from_sun_km: 778500000, fun_fact: "Twice as massive as all the other planets combined")
neptune = Planet.new("Neptune", "blue with a dark blue eye", mass_kg: 1.024e26, distance_from_sun_km: 4495000000, fun_fact: "Only planet in the solar system not visible to the naked eye")