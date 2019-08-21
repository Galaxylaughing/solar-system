require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/user.rb'
require_relative '../lib/solar_system.rb'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class TestUser < Minitest::Test
  
  def setup
    @our_solar_system = SolarSystem.new(star_name: "Sol")
    @kepler_system = SolarSystem.new(star_name: "Kepler-20")
    @user = User.new(@our_solar_system)
  end
  
  def test_that_location_is_correct
    assert_equal @user.location, @our_solar_system
  end
  
  def test_that_location_cannot_be_nonsystem
    new_system = "Kepler-20"
    assert_raises(ArgumentError) { new_user = User.new(new_system) }
  end
  
  def test_that_location_switching_works
    @user.switch_systems(@kepler_system, @our_solar_system)
    assert_equal @user.location, @kepler_system
  end
  
  def test_that_user_cannot_switch_to_nonsystem
    new_system = "Kepler-20"
    assert_raises(ArgumentError) { @user.switch_systems(new_system, @our_solar_system) }
  end
  
  def test_that_user_cannot_switch_from_a_nonsystem
    current_system = "Kepler-20"
    assert_raises(ArgumentError) { @user.switch_systems(@kepler_system, current_system) }
  end
  
end