# Functions and Files

filename = ARGV.first

def print_all(f)
  puts f.read  
end

def rewind(f)
  f.seek(0)
end

def print_a_line(line_count, f)
  puts "#{line_count}, #{f.gets.chomp}"
end

file = File.open(filename)

puts "First let's print the whole file:\n"
print_all(file)

puts "Now let's rewind, kind of like a tape."
rewind(file)

puts "Let's print three lines:"
current_line = 1
print_a_line(current_line, file)
current_line += 1
print_a_line(current_line, file)
current_line += 1
print_a_line(current_line, file)
