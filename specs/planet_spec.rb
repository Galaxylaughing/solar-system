require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/planet.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestPlanet < Minitest::Test
  
  def test_planet_instantiation
    planet = Planet.new("Name", "color", mass_kg: 20, distance_from_sun_km: 20, fun_fact: "none")
    assert_instance_of Planet, planet
  end
  
  def test_reader_methods
    mars_name = "Mars"
    mars_color = "red"
    
    mars = Planet.new(mars_name, mars_color, mass_kg: 20, distance_from_sun_km: 20, fun_fact: "none")
    
    assert_equal mars.color, mars_color
  end
  
  def test_insufficient_mass_error    
    assert_raises(ArgumentError) { Planet.new("Name", "color", mass_kg: 0, distance_from_sun_km: 20, fun_fact: "none") }
  end
  
  def test_insufficient_distance_error
    assert_raises(ArgumentError) { Planet.new("Name", "color", mass_kg: 20, distance_from_sun_km: 0, fun_fact: "none") }
  end
  
end
