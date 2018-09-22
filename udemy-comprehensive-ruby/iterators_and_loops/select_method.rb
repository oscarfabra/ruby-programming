# Given an array of integers
# Only grab the even integers
# arr = (1..10).to_a.select do |x|
#   x.even?
# end
# p arr

# arr = (1..10).to_a.select { |x| x.even? }
# p arr

# arr = (1..10).to_a.select(&:even?)
# p arr

# Given an array of strings
# Return only the words that are over 5 letters
# arr = %w(The quickzzzz brown fox jumped over thettttt lazy dog)
# arr = arr.select { |x| x.length > 5 }
# p arr

# Given an array of strings
# Return all of the vowels
arr = %w(a b c d e f g h i j k).select { |x| x =~ /[aeiou]/}
p arr