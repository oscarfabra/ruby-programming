x = 10
y = 100
z = 10

if x == y
  puts "x is equal to y"
elsif x >= z
  puts "x is greater than or equal to z"
elsif x < y # It bypasses this code even though is true
  puts "x is less than y"
else
  puts "something else"
end
  