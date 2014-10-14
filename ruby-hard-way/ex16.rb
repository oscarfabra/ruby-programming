# Reading and Writing Files

filename = ARGV.first

puts "Opening the file #{filename}..."
file = File.open(filename, 'r')    # Other options include r, w, a, w+, a+
content = file.read
puts "This is what it contains: "
print content
file.close

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

file = File.open(filename, 'w')
$stdin.gets

puts "Truncating the file. Goodbye!"
file.truncate(0)

puts "Now I'm going to ask you for three lines."

print "Line 1: "
line1 = $stdin.gets.chomp
print "Line 2: "
line2 = $stdin.gets.chomp
print "Line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

file.write(line1)
file.write("\n")
file.write(line2)
file.write("\n")
file.write(line3)
file.write("\n")

puts "And finally, we close it."
file.close