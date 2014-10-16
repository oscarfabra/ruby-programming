# Hashes, Oh Lovely Hashes

# Create a mapping of state to abbreviation.
states = {
  'Oregon' => 'OR',
  'Florida' => 'FL',
  'California' => 'CA',
  'Pennsylvania' => 'PA',
  'Michigan' => 'MI'
}

# Create a basic set of states and some cities in them.
cities = {
  'CA' => 'San Francisco',
  'TX' => 'Houston',
  'FL' => 'Jacksonville'
}

# Add more cities
cities['TX'] = 'Austin'     # Previous city gets overwritten
cities['OR'] = 'Portland'

# Puts out some cities
puts '-' * 10
puts "TX State has: #{cities['TX']}"
puts "OR State has: #{cities['OR']}"

# Puts some states
puts '-' * 10
puts "Michigan's abbreviation is: #{states['Michigan']}"
puts "Florida's abbreviation is: #{states['Florida']}"

# Do it by using the state, then the cities dictionary
puts '-' * 10
puts "California has: #{cities[states['California']]}"
puts "Florida has: #{cities[states['Florida']]}"

# Puts every state abbreviation
puts '-' * 10
states.each do |state, abbrev|
  puts "#{state}, #{abbrev}."
end

# Puts every city in state
puts '-' * 10
cities.each do |abbrev, city|
  puts "#{abbrev} has the city #{city}"
end

# Now do both at the same time
puts '-' * 10
states.each do |state, abbrev|
  city = cities[abbrev]
  puts "#{state} is abbreviated #{abbrev} and has city #{city}"
end

# By default Ruby says "nil" when something isn't there
puts '-' * 10
state = states['New York']
if !state
  puts "Sorry, state isn't there."
end

# Default values using ||= with the nil result
city = cities['NY']
city ||= "Not found."
puts "The city for the state 'NY' is: #{city}"