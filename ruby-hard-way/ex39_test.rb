# Using Own Hash Module

# Require dictionary
require './ex39_dictionary.rb'

# Create a mapping of state to abbreviation.
states = Dictionary.new
Dictionary.set states, 'Oregon', 'OR'
Dictionary.set states, 'Florida', 'FL'
Dictionary.set states, 'California', 'CA'
Dictionary.set states, 'Pennsylvania', 'PA'
Dictionary.set states, 'Michigan', 'MI'

# Create a basic set of states and some cities in them.
cities = Dictionary.new
Dictionary.set cities, 'CA', 'San Francisco'
Dictionary.set cities, 'TX', 'Houston'
Dictionary.set cities, 'FL', 'Jacksonville'

# Add more cities
Dictionary.set cities, 'TX', 'Austin'     # Previous city gets overwritten
Dictionary.set cities, 'OR', 'Portland'

# Puts out some cities
puts '-' * 10
puts "TX State has: #{Dictionary.get cities, 'TX'}"
puts "OR State has: #{Dictionary.get cities, 'OR'}"

# Puts some states
puts '-' * 10
puts "Michigan's abbreviation is: #{Dictionary.get states, 'Michigan'}"
puts "Florida's abbreviation is: #{Dictionary.get states, 'Florida'}"

# Do it by using the state, then the cities dictionary
puts '-' * 10
puts "California has: #{Dictionary.get cities, (Dictionary.get states, 'California')}"
puts "Florida has: #{Dictionary.get cities, (Dictionary.get states, 'Florida')}"

# Puts every state abbreviation
puts '-' * 10
Dictionary.list states

# Puts every city in state
puts '-' * 10
Dictionary.list cities

# By default Ruby says "nil" when something isn't there
puts '-' * 10
state = Dictionary.get states, 'New York'
if !state
  puts "Sorry, state isn't there."
end

# Default values using ||= with the nil result
city = Dictionary.get cities, 'NY', "Not Found"
puts "The city for the state 'NY' is: #{city}"