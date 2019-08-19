require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/solar_system.rb'

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
  
end
