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

# create solar system
our_solar_system = SolarSystem.new(star_name: "Sol")

# add some planets to the solar system
our_solar_system.add_planet(Planet.new("Earth", "blue and green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "Only planet known to support life"))

our_solar_system.add_planet(Planet.new("Mars", "red", mass_kg: 6.39e23, distance_from_sun_km: 227900000, fun_fact: "Technically a cold desert world"))

our_solar_system.add_planet(Planet.new("Jupiter", "stripey orange and white", mass_kg: 1.898e27, distance_from_sun_km: 778500000, fun_fact: "Twice as massive as all the other planets combined"))

our_solar_system.add_planet(Planet.new("Neptune", "blue with a dark blue eye", mass_kg: 1.024e26, distance_from_sun_km: 4495000000, fun_fact: "Only planet in the solar system not visible to the naked eye"))

# venus
# mass = 4.867e24
# distance = 108200000
# fun fact = The brightest object in the sky after the Sun and the Moon

def ask_for_planet_property(property)
  print "Please enter the planet's #{property}:  "
  user_input = gets.chomp
  return user_input
end

def ensure_valid_number(planet, property_symbol, name_of_property)
  until planet[property_symbol]
    user_mass = ask_for_planet_property(name_of_property).to_i
    if user_mass > 0
      planet[property_symbol] = user_mass
    else
      puts "  You did not enter a valid #{name_of_property}"
    end
  end
end

def ask_for_planet_information()
  planet = {}
  
  planet[:name] = ask_for_planet_property("name").capitalize
  planet[:color] = ask_for_planet_property("color")
  ensure_valid_number(planet, :mass_kg, "mass in kilograms")
  ensure_valid_number(planet, :distance_from_sun_km, "distance from the sun in kilometers")
  planet[:fun_fact] = ask_for_planet_property("fun fact")
  
  return planet
end

def add_planet(solar_system)
  planet_info = ask_for_planet_information()
  
  new_planet = Planet.new(planet_info[:name], planet_info[:color], mass_kg: planet_info[:mass_kg], distance_from_sun_km: planet_info[:distance_from_sun_km], fun_fact: planet_info[:fun_fact])
  
  solar_system.add_planet(new_planet)
end

def display_planet_details(solar_system)
  keep_asking = true
  until !keep_asking
    print "Please enter a planet: "
    user_input = gets.chomp.downcase
    if solar_system.find_planet_by_name(user_input) == "No such planet found"
      puts "  #{user_input} is not a valid planet"
    else
      puts solar_system.find_planet_by_name(user_input).summary
      keep_asking = false
    end
  end
end

def ask_user_for_commands(solar_system)
  
  user_input = ""
  until !user_input
    print "Please enter a command: "
    user_input = gets.chomp.downcase.to_sym
    
    case user_input
    when :exit
      user_input = false
    when :"list planets"
      puts solar_system.list_planets()
    when :"planet details"
      display_planet_details(solar_system)
    when :"add planet"
      add_planet(solar_system)
    else
      puts "  #{user_input} is not a valid command"
    end
    
  end
  
end

ask_user_for_commands(our_solar_system)