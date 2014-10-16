# Loops and Arrays

the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# Ruby style loop
the_count.each do |number|
  puts "This is count #{number}."
end

# Another Ruby style loop
fruits.each do |fruit|
  puts "A fruit of type: #{fruit}."
end

# Different sintax, also Ruby style
change.each {|i| puts "I got #{i}."}

# Builds a list
elements = []

# Uses the range operator
(0...5).each do |i|
  puts "Adding #{i} to the list..."
  elements << i
end

# Now we can print them out
elements.each {|i| puts "Element was: #{i}."}