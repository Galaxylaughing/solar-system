require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/solar_system.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestSolarSystem < Minitest::Test
  def setup
    @solar_system = SolarSystem.new
  end
  
  def test_solar_system_instantiation
    refute_nil @solar_system
  end
end
