# Functions Can Return Something

def add(a, b)
  puts "ADDING #{a} + #{b}"  
  a + b
end

def subtract(a, b)
  puts "SUBTRACTING #{a} - #{b}"
  a - b
end

def multiply(a, b)
  puts "MULTIPLYING #{a} * #{b}"  
  a * b
end

def divide(a, b)
  puts "DIVIDING #{a} / #{b}"  
  a / b
end

puts "Let's do some math with just functions!"

age = add(20, 5)
height = subtract(172, 3)
weight = multiply(33, 2)
iq = divide(400, 2)

puts "Age: #{age}\nHeight: #{height}\nWeight: #{weight}\nIQ: #{iq}"

# A puzzle for the extra credit, type it in anyway.
puts "Here is a puzzle."

what = add(age, subtract(height, multiply(weight, divide(iq, 2))))

puts "That becomes: #{what}."