# By considering the terms in the Fibonacci sequence whose values do not exceed
# four million, find the sum of the even-valued terms.

def sum_of_even_valued_terms_in_fibonacci_sequence(upper_bound)
  return 0 if upper_bound < 2

  sum, a, b = 0, 1, 1
  while b <= upper_bound
    a, b = b, b + a
    sum += b if b % 2 == 0
  end

  sum
end

p sum_of_even_valued_terms_in_fibonacci_sequence 4_000_000