# More files (copying from one file to another)

filename1, filename2 = ARGV

puts "Copying from #{filename1} to #{filename2}"

file1 = File.open(filename1)
data = file1.read

puts "The input file is #{data.length} bytes long."

puts "Does the output file exist? #{File.exist?(filename2)}"
puts "Ready, hit RETURN to continue, CTRL-C to abort."
$stdin.gets

file2 = File.open(filename2, 'w')
file2.write(data)

puts "Alright, all done."

file2.close
file1.close