cars = 100
space_in_a_car = 4.0
drivers = 30
passengers = 90
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car
average_passengers_per_car = passengers / cars_driven

puts "There are #{cars} cars available."
puts "There are only #{drivers} drivers available."
puts "There will be #{cars_not_driven} empty cars today."
puts "We can transport #{carpool_capacity} people today."
puts "We have #{passengers} to carpool today."
puts "We need to put about #{average_passengers_per_car} in each car."
puts ""

name = 'Zed A. Shaw'
age = 35 # not a lie in 2009
height = 74 # inches
height_in_cm = height * 2.54
weight = 180 # lbs
weight_in_kg = weight * 0.45
eyes = 'Blue'
teeth = 'White'
hair = 'Brown'

puts "Let's talk about #{name}."
puts "He's #{height_in_cm} centimeters tall."
puts "He's #{weight_in_kg} kilograms heavy."
puts "Actually that's not too heavy."
puts "He's got #{eyes} eyes and #{hair} hair."
puts "His teeth are usually #{teeth} depending on the cofee."

# this line is tricky, try to get it exactly right
puts "If I add #{age}, #{height_in_cm}, and #{weight_in_kg} I get #{age + 
height_in_cm + weight_in_kg}"