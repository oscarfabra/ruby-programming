# Dynamic arguments, array
# def roster *players
#   p players
# end

# roster 'Altuve', 'Gattis', 'Springer', 'Bregman', 'Correa'

# Dynamic arguments, hash
# def roster **players_with_positions
#   players_with_positions.each do |player, position|
#     puts "Player: #{player}"
#     puts "Position: #{position}"
#     puts "\n"
#   end
# end

# data = {
#   "Altuve": "2nd Base",
#   "Alex Bregman": "3rd Base",
#   "Evan Gattis": "Catcher",
#   "George Springer": "OF"
# }

# roster data

def invoice options = {}
  puts options[:company]
  puts options[:total]
  puts options[:state]
  puts options[:city]
  puts options[:tax_rate]
end

invoice company: "Google", total: 100.0, tax_rate: 0.19
