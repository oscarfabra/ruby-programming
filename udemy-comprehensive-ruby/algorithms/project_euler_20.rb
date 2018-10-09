# Find the sum of the digits in the number 100!

def sum_of_digits_in_factorial(n)
  (1..n).inject(:*).to_s.split(//).map(&:to_i).inject(:+)
end

p sum_of_digits_in_factorial 100