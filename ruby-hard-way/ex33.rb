# While Loops

print "Enter a positive integer: "
top = $stdin.gets.chomp.to_i

i = 0
numbers = []

while i < top
  puts "At the top i is #{i}."
  numbers << i

  i += 1
  puts "Numbers now: ", numbers
  puts "At the bottom i is #{i}."
end

# First form of Ruby-style loop
puts "The numbers: "
numbers.each {|num| puts num }

# Another form of Ruby-style loop
puts "The numbers again:"
numbers.each do |num|
  puts num
end

# Using ranges
puts "Numbers should be: "
(0...top).each {|num| puts num }