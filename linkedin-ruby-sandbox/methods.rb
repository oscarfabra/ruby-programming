def welcome(name="World")
	puts "Hello #{name}!"
	1 + 1
end

def add_and_subtract(n1=0, n2=0)
	add = n1 + n2
	sub = n1 - n2
	return [add, sub]
end

# Underscore between words, like variable names
def longest_word(words=[])
  longest_word = words.inject do |memo,word|
    memo.length > word.length ? memo : word
  end
  return longest_word
end

# Method names can have question marks in them
# Useful for tests and booleans
def over_five?(value=nil)
	return "Exactly 5" if value.to_i == 5
	return value.to_i > 5 ? 'Over 5' : 'Under 5'
end

welcome("Mary")
returned_value = welcome("John")
puts returned_value

add, sub = add_and_subtract(2, 2)
puts add
puts sub


fruits = ['apple', 'pear', 'banana', 'plum']
puts longest_word(fruits).length

puts over_five?(5)


