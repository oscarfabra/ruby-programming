# More practice

puts "Let's practice everything."
puts 'You\'d need to know \'bout escapes with \\ that do \n newlines and \t
tabs.'

poem = <<END
\tThe lovely world
with logic so firmly planted
cannot discern \n the needs of love 
nor comprehend passion from intuition
and requires an explanation
\n\t\twhere there is none.
END

puts "-" * 20
puts poem
puts "-" * 20

five = 10 - 2 + 3 - 6
puts "This should be five: #{five}"

def secret_formula(started)
  jelly_beans = started * 500
  jars = jelly_beans / 1000
  crates = jars / 100
  return jelly_beans, jars, crates
end

start = 1000.0
beans, jars, crates = secret_formula(start)

puts "With a starting point of: #{start}..."
puts "We'd have #{beans} beans, #{jars} jars, #{crates} crates."

start /= 10.0
beans, jars, crates = secret_formula(start)

puts "With a starting point of: #{start}..."
puts "We'd have #{beans} beans, #{jars} jars, #{crates} crates."