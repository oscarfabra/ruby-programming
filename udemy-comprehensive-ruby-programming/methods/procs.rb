# full_name = Proc.new { |first, last| first + " " + last }
# p full_name["Oscar", "Fabra"]
# p full_name.call("Oscar", "Fabra")

# full_name = Proc.new do |first|
#   first * 5
# end
# p full_name["Oscar"]