# Reading files

filename = ARGV.first
txt = File.open(filename)            # filename must be a string
puts "Here's your file #{filename}:"
print txt.read
txt.close

print "Type the filename again: "
file_again = $stdin.gets.chomp
txt_again = File.open(file_again)    # file_again must be a string
print txt_again.read
txt_again.close