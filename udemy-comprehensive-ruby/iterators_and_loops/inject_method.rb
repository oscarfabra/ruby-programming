# Summing all elements of an array
total = 0
[3, 2, 5, 8, 9, 345, 546546, 45, 3].each do |i|
  total += i
end
puts total

# Using inject
total = [3, 2, 5, 8, 9, 345, 546546, 45, 3].inject(&:+)
puts total

# Multiplying all values
total = [3, 2, 5, 8, 9, 345, 546546, 45, 3].inject(&:*)
puts total