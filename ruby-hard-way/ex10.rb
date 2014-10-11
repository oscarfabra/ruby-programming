# This is how we escape characters
my_height_one = "I am 6'2\" tall. "
my_height_two = 'I am 6\'2" tall. '

puts my_height_one
puts my_height_two
puts ""

# Exercise 10
tabby_cat = "\tI'm tabbed in."
persian_cat = "I'm split\non a line."
backslash_cat = "I'm \\ a \\ cat."

fat_cat = """
I'll do a list:
\t* Cat food.
\t* Fishies.
\t* Catnip.\n\t* Grass.
"""

puts tabby_cat
puts persian_cat
puts backslash_cat
puts fat_cat
puts ""