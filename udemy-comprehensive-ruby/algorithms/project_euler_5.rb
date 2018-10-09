# What is the smallest positive number that is evenly divisible by all the
# numbers from 1 to 20?

def smallest_multiple_of_numbers_1_to_n(n)
  i = n * n
  
  loop do
    i += n
    found = true
    (1..n).each do |j|
      found = false if i % j != 0
      break if !found
    end
    break if found 
  end
  i
end

p smallest_multiple_of_numbers_1_to_n 20

# The most concise solution, using reduce method
# p (1..20).to_a.reduce(:lcm)