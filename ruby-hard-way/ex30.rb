# Else and If

people = 30
cars = 40
trucks = 40

if cars > people
  puts "We should take the cars."  
elsif cars < people
  puts "We should not take the cars."
else
  puts "Each take a car."  
end

if trucks > cars
  puts "That's too many trucks."
elsif trucks < cars
  puts "Maybe we could take the trucks."
else
  puts "Trucks are cooler!"
end

if people > trucks
  puts "Alright, let's just take the trucks."
elsif trucks < people
  puts "Fine, let's stay home then."
else
  puts "Each take a truck!"
end