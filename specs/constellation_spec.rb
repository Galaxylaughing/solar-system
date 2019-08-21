require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/constellation.rb'
require_relative '../lib/solar_system.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class TestConstallation < Minitest::Test
  
  def setup
    @our_solar_system = SolarSystem.new(star_name: "Sol")
    @kepler_system = SolarSystem.new(star_name: "Kepler-20")
    @our_constellation = Constellation.new("Some Constellation")
  end
  
  def test_that_adding_a_system_works
    @our_constellation.add_system(@our_solar_system)
    assert @our_constellation.systems_list.include?(@our_solar_system)
  end
  
  def test_that_system_to_add_cannot_be_nonsystem
    new_system = "Kepler-20"
    assert_raises(ArgumentError) { @our_constellation.add_system(new_system) }
  end
  
  def test_listing_constellations
    @our_constellation.add_system(@our_solar_system)
    @our_constellation.add_system(@kepler_system)
    assert_equal @our_constellation.list_systems, "List of systems in this constellation:\n1. Sol System\n2. Kepler-20 System"
  end
  
  def test_find_system_by_name
    @our_constellation.add_system(@kepler_system)
    assert_equal @our_constellation.find_system_by_name("Kepler-20"), @kepler_system
  end
  
  def test_find_system_does_not_find_nonsystem
    assert_equal @our_constellation.find_system_by_name("Alpha Centauri"), "No such system found"
  end
  
  def test_find_system_lists_multiple_systems
    dup_kepler_system = SolarSystem.new(star_name: "Kepler-20")
    @our_constellation.add_system(@kepler_system)
    @our_constellation.add_system(dup_kepler_system)
    
    assert_equal @our_constellation.find_system_by_name("Kepler-20"), "Multiple systems with that star were found. These were:\n1. #{@kepler_system}\n2. #{dup_kepler_system}"
  end
  
end