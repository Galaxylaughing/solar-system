require_relative "planet.rb"
require_relative "solar_system"
require_relative "constellation.rb"
require_relative "user.rb"

## VARIABLES

# create new constellation
current_constellation = Constellation.new("Constellation")

# create solar system
our_solar_system = SolarSystem.new(star_name: "Sol")

# add some planets to the solar system
our_solar_system.add_planet(Planet.new("Earth", "blue and green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "Only planet known to support life"))

our_solar_system.add_planet(Planet.new("Mars", "red", mass_kg: 6.39e23, distance_from_sun_km: 227900000, fun_fact: "Technically a cold desert world"))

our_solar_system.add_planet(Planet.new("Jupiter", "stripey orange and white", mass_kg: 1.898e27, distance_from_sun_km: 778500000, fun_fact: "Twice as massive as all the other planets combined"))

our_solar_system.add_planet(Planet.new("Neptune", "blue with a dark blue eye", mass_kg: 1.024e26, distance_from_sun_km: 4495000000, fun_fact: "Only planet in the solar system not visible to the naked eye"))

# create second solar system
kepler_system = SolarSystem.new(star_name: "Kepler-20")

kepler_system.add_planet(Planet.new("Kepler-20c", "unknown color", mass_kg: 7.6148972e25, distance_from_sun_km: 290.0, fun_fact: "Has a mass similar to Neptune, but is much closer to Kepler-20 than Neptune is to Sol"))

kepler_system.add_planet(Planet.new("Kepler-20b", "rocky", mass_kg: 5.786868e25, distance_from_sun_km: 290.0, fun_fact: "Classified as a 'Super-Earth'"))

kepler_system.add_planet(Planet.new("Kepler-20d", "unknown color", mass_kg: 6.0132068e25, distance_from_sun_km: 290.0, fun_fact: "Technically the furthest planet from Kepler-20, but has an orbit similar to Mercury so it is still a hot planet"))

kepler_system.add_planet(Planet.new("Kepler-20e", "dark red", mass_kg: 1.839376e25, distance_from_sun_km: 290.0, fun_fact: "First planet smaller than Earth discovered to orbit a sun other than Sol"))

kepler_system.add_planet(Planet.new("Kepler-20f", "unknown color", mass_kg: 6.0132068e25, distance_from_sun_km: 290.0, fun_fact: "Planet with the closest radius to Earth"))

# add systems to constellation
current_constellation.add_system(our_solar_system)
current_constellation.add_system(kepler_system)


## METHODS
def find_distance_between(solar_system)
  prompt = "Please enter the"
  planet_1 = ask_for_object_name(:solar_system, object_name: solar_system, prompt: (prompt + " first planet: "))
  planet_2 = ask_for_object_name(:solar_system, object_name: solar_system, prompt: (prompt + " second planet: "))
  
  puts "The distance between #{planet_1.name} and #{planet_2.name} is #{solar_system.distance_between(planet_1, planet_2)} km."
end

def ask_for_planet_property(property)
  print "Please enter the planet's #{property}:  "
  user_input = gets.chomp
  return user_input
end

def ensure_valid(planet, property_symbol, name_of_property, is_number: false, is_string: false, capitalize: false, downcase: false)
  until planet[property_symbol]
    user_property = ask_for_planet_property(name_of_property)
    is_valid = true
    if is_number == true && user_property.to_i > 0
      user_property = user_property.to_i
    elsif is_string == true && !!(user_property =~ /\A[-a-zA-Z0-9_\s]+\Z/)
      user_property = user_property.capitalize if capitalize == true
      user_property = user_property.downcase if downcase == true
    else
      puts "  You did not enter a valid #{name_of_property}"
      is_valid = false
    end
    (planet[property_symbol] = user_property) if is_valid == true
  end
end

def get_planet_details()
  planet = {}
  
  ensure_valid(planet, :name, "name", is_string: true, capitalize: true)
  ensure_valid(planet, :color, "color", is_string: true, downcase: true)
  ensure_valid(planet, :mass_kg, "mass in kilograms", is_number: true)
  ensure_valid(planet, :distance_from_sun_km, "distance from the sun in kilometers", is_number: true)
  ensure_valid(planet, :fun_fact, "fun fact", is_string: true)
  
  return planet
end

def add_new_planet(solar_system)
  planet_info = get_planet_details()
  
  new_planet = Planet.new(planet_info[:name], planet_info[:color], mass_kg: planet_info[:mass_kg], distance_from_sun_km: planet_info[:distance_from_sun_km], fun_fact: planet_info[:fun_fact])
  
  solar_system.add_planet(new_planet)
end


def ask_for_object_name(object_type, object_name:, prompt:)
  keep_asking = true
  until !keep_asking
    print prompt
    user_input = gets.chomp.downcase
    
    case object_type
    when :solar_system
      if object_name.find_planet_by_name(user_input) == "No such planet found"
        puts "  #{user_input} is not a valid planet"
      else
        new_object = object_name.find_planet_by_name(user_input)
        keep_asking = false
      end
    when :constellation
      if object_name.find_system_by_name(user_input) == "No such system found"
        puts "  #{user_input} is not a valid solar system"
      else
        new_object = object_name.find_system_by_name(user_input)
        keep_asking = false
      end
    else
      raise ArgumentError, "#{object_type} is not a known object"
    end
    
  end
  return new_object
end

def display_planet_details(solar_system)
  planet = ask_for_object_name(:solar_system, object_name: solar_system, prompt: "Please enter a planet: ")
  puts planet.summary
end

def switch_systems(user, constellation, current_system)
  user_choice = ask_for_object_name(:constellation, object_name: constellation, prompt: "Please enter a solar system: ")
  current_system = user.switch_systems(user_choice, current_system)
  return current_system
end

def list_possible_commands()
  possible_commands = {
    :exit => "exit the program",
    :"list commands" => "list all possible commands",
    :"get current system" => "identify current system",
    :"list systems" => "list all systems",
    :"switch systems" => "switch to a different system",
    :"list planets" => "list planets in current system",
    :"get planet details" => "enter a planet and recieve its information",
    :"add planet" => "add a planet to the current system",
    :"find distance between" => "enter two planets and receive the distance between them"
  }
  
  list_of_commands = "Here are the possible commands:"
  possible_commands.each_pair do |command_name, command_info|
    list_of_commands << "\n  enter \"#{command_name.to_s}\" to #{command_info}"
  end
  return list_of_commands
end

def ask_user_for_commands(constellation)  
  # establish default solar system
  current_solar_system = constellation.systems_list[0]
  # establish user
  current_user = User.new(current_solar_system)
  
  # ask user for commands
  user_input = ""
  until !user_input
    print "Please enter a command: "
    user_input = gets.chomp.downcase.to_sym
    
    case user_input
    when :exit
      user_input = false
    when :"list commands"
      puts list_possible_commands()
    when :"get current system"
      puts "The current solar system is: #{current_solar_system.star_name} System"
    when :"list systems"
      puts constellation.list_systems()
    when :"switch systems"
      current_solar_system = switch_systems(current_user, constellation, current_solar_system)
    when :"list planets"
      puts current_solar_system.list_planets()
    when :"get planet details"
      display_planet_details(current_solar_system)
    when :"add planet"
      add_new_planet(current_solar_system)
    when :"find distance between"
      find_distance_between(current_solar_system)
    else
      puts "  #{user_input} is not a valid command"
    end
    
  end
end

## MAIN CODE
ask_user_for_commands(current_constellation)
