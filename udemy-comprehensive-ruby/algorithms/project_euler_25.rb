# What is the index of the first term in the Fibonacci sequence to contain
# 1000 digits?

def first_term_in_fibonacci_to_contain_given_digits(digits)
  
  if digits == 1
    return 1
  end

  i, a, b = 2, 1, 1
  while b.to_s.length < digits
    a, b = b, a + b
    i += 1
  end

  i
end

p first_term_in_fibonacci_to_contain_given_digits 1000