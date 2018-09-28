# Read files. chomp removes the newlines character
teams_one = File.read("files/teams.txt").chomp
teams_two = File.read("files/teams2.txt").chomp

# Put the string read into an array
teams_master = teams_one.split(", ") + teams_two.split(", ")

teams_master.each { |team| p team.upcase }