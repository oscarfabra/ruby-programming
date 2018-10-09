# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

require 'prime'

prime_array = Prime.take_while { |p| p < 2_000_000 }

total_count = prime_array.inject { |sum, x| sum + x }

p total_count

# 142,913,828,922