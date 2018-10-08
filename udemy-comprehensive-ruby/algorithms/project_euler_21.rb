# Let d(n) be defined as the sum of proper divisors of n (numbers less than n 
# which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and 
# each of a and b are called amicable numbers.
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 
# 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 
# 71 and 142; so d(284) = 220.
# Evaluate the sum of all the amicable numbers under 10000.

# Evaluates d(n)
def d_sum(n)
  return 1 if n == 1

  i, divisors = 1, []
  while i <= n / 2
    if n % i == 0
      divisors << i
    end
    i += 1
  end

  divisors.inject(:+)
end

# Returns the sum of all amicable numbers under upper_bound
def amicable_numbers(upper_bound)
    a, n = [], 1
    while n < upper_bound
       m = d_sum(n)
       if m != n && d_sum(m) == n
         a << m << n
       end
      n += 1
    end
    # Return the sum of the numbers in the array without duplicates
    a.uniq.inject(:+)  
end

# p d_sum(284)
p amicable_numbers 10_000