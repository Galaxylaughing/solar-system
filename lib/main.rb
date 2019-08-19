require_relative "planet.rb"

def main()
  
  earth = Planet.new("Earth", "blue-green", mass_kg: 5.972e24, distance_from_sun_km: 149600000, fun_fact: "the only planet known to support life")
  
  jupiter = Planet.new('Jupiter', 'stripey orange and white', mass_kg: 1.898e27, distance_from_sun_km: 778000000, fun_fact: 'twice as massive as all the other planets combined')
  
  puts earth.summary
  puts jupiter.summary
end

print main()