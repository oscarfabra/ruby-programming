# Functions and Variables

def cheese_and_crackers(cheese_count, boxes_of_crackers)
  puts "You have #{cheese_count} cheeses!"  
  puts "You have #{boxes_of_crackers} boxes of crackers!"
  puts "Man that's enough for a party!"
  puts "Get a blanket.\n"
end

def chicken_legs_with_honey(chicken_legs, honey_packets)
  puts "We have #{chicken_legs} chicken legs!"
  puts "And #{honey_packets} packets of honey!"
  puts "Lets put some honey on our chicken legs... mmh!\n"
end  

puts "We can just give the function numbers directly:"
cheese_and_crackers(20, 30)

puts "OR, we can use variables from our script:"
cheese = 10
crackers = 50

cheese_and_crackers(cheese, crackers)

puts "We can even do math inside too:"
cheese_and_crackers(10 + 20, 5 + 6)

puts "And we can combine the two, variables and math:"
cheese_and_crackers(cheese + 100, crackers + 50)

puts "Chicken legs with honey... delicious!"
chicken_legs_with_honey(4, 3) 