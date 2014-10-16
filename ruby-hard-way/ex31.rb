# Making Decisions

puts "You enter a dark room with two doors. Do you go through door #1 or door
#2?"
print "> "
door = $stdin.gets.chomp

if door == "1"
  puts "There's a gian bear here eating a cheese cake. What do you do?"
  puts "1. Take the cake."
  puts "2. Scream at the bear."

  print "> "
  bear = $stdin.gets.chomp

  if bear == "1"
    puts "The bear eats your face off."
  elsif bear == "2"
    puts "The bear eats your legs off. Good job!"
  else
    puts "Well, doing %s is probably better. Bear runs away." % bear
  end

elsif door == "2"
  puts "You enter a paradise full of delicious fruits. Which would you choose?"
  puts "1. Blueberries."
  puts "2. Mangos."
  puts "3. Watermelons."

  print "> "
  fruit = $stdin.gets.chomp
  if fruit == "1" || fruit == "2"
    puts "Mmmh... delicious!"
  else
    puts "Exquisite!"
  end
else
  puts "You wait and go out safe. Good job!"
end