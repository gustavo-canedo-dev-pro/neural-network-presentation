
rats = [0.58, 0.79, 0.78, 0.53, 0.39, 0.51, 0.39, 0.48, 0.61, 0.42, 0.6, 15, 13.3, 8]
dogs = [ 9.79, 19.23, 8.08, 8.44, 3.04, 22.81, 12.04, 8.87, 9.61, 11.08, 13 ]

animal = dogs

animal.map do |animal|
  [animal, rand(1.8..4).round(2)]
end.flatten