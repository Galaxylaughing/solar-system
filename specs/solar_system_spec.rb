require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/solar_system.rb'
require_relative '../lib/planet.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestSolarSystem < Minitest::Test
  def setup
    @solar_system = SolarSystem.new(star_name: "Arcturus")
  end
  
  def test_solar_system_instantiation
    refute_nil @solar_system
  end
  
  def test_saves_parameter_as_instance_variable
    refute_nil @solar_system.star_name
  end
  
  def test_variables_are_readable
    assert_equal @solar_system.star_name, "Arcturus"
  end
  
  def test_variables_are_not_writable
    assert_raises(NoMethodError) { @solar_system.star_name = "Alpha" }
  end
  
  def test_planets_variable_is_an_array
    assert_instance_of Array, @solar_system.planets
  end
  
  def test_add_planet_adds_planet_instance_to_list
    mars = Planet.new("Mars", "red", mass_kg: 20, distance_from_sun_km: 20, fun_fact: "homeworld of the martians")
    
    @solar_system.add_planet(mars)
    
    assert @solar_system.planets.include?(mars)
  end
  
  def test_add_planet_does_not_add_nonplanet
    mars = ["Mars", "red", 20, 200, "home of the martians"]
    assert_raises(ArgumentError) { @solar_system.add_planet(mars) }  
  end
  
  def test_return_list_of_planets
    mars = Planet.new("Mars", "red", mass_kg: 20, distance_from_sun_km: 20, fun_fact: "homeworld of the martians")
    earth = Planet.new("Earth", "blue-green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "Only planet known to support life")
    jupiter = Planet.new('Jupiter', 'stripey orange and white', mass_kg: 1.898e27, distance_from_sun_km: 778000000, fun_fact: 'Twice as massive as all the other planets combined')
    
    @solar_system.add_planet(mars)
    @solar_system.add_planet(earth)
    @solar_system.add_planet(jupiter)
    
    desired_output = "Planets orbiting Arcturus\n1. Mars\n2. Earth\n3. Jupiter"
    
    assert_equal @solar_system.list_planets, desired_output
  end
  
  def test_find_planet_by_name_finds_planet
    mars = Planet.new("Mars", "red", mass_kg: 20, distance_from_sun_km: 20, fun_fact: "homeworld of the martians")
    earth = Planet.new("Earth", "blue-green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "Only planet known to support life")
    jupiter = Planet.new('Jupiter', 'stripey orange and white', mass_kg: 1.898e27, distance_from_sun_km: 778000000, fun_fact: 'Twice as massive as all the other planets combined')
    
    @solar_system.add_planet(mars)
    @solar_system.add_planet(earth)
    @solar_system.add_planet(jupiter)
    
    assert_equal @solar_system.find_planet_by_name("MarS"), mars
  end
  
  def test_find_planet_by_name_gives_error_message_if_not_found
    assert_equal @solar_system.find_planet_by_name("mars"), "No such planet found"
  end
  
  def test_find_multiple_planets_of_the_same_name
    mars = Planet.new("Mars", "red", mass_kg: 20, distance_from_sun_km: 20, fun_fact: "homeworld of the martians")
    earth = Planet.new("Mars", "blue-green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "Only planet known to support life")
    
    @solar_system.add_planet(mars)
    @solar_system.add_planet(earth)
    
    assert_equal @solar_system.find_planet_by_name("mars"), "Multiple planets of that name were found. These were:\n1. #{mars}\n2. #{earth}"
  end
  
  def test_distance_between_method_works_with_planets
    earth = Planet.new("Earth", "blue-green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "Only planet known to support life")
    jupiter = Planet.new('Jupiter', 'stripey orange and white', mass_kg: 1.898e27, distance_from_sun_km: 778000000, fun_fact: 'Twice as massive as all the other planets combined')
    
    @solar_system.add_planet(earth)
    @solar_system.add_planet(jupiter)
    
    assert_equal @solar_system.distance_between(earth, jupiter), 628400000
  end
  
  def test_distance_between_method_raises_error_with_nonplanets
    earth = Planet.new("Earth", "blue-green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "Only planet known to support life")
    jupiter = Planet.new('Jupiter', 'stripey orange and white', mass_kg: 1.898e27, distance_from_sun_km: 778000000, fun_fact: 'Twice as massive as all the other planets combined')
    
    @solar_system.add_planet(earth)
    
    assert_raises(ArgumentError) { @solar_system.distance_between(earth, jupiter) }
  end
  
end
