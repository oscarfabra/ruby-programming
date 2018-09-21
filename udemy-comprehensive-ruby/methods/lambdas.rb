# full_name = lambda { |first, last| first + " " + last }
# p full_name["Oscar", "Fabra"]

full_name = ->(first, last) { first + " " + last }
p full_name["Oscar", "Fabra"]
p full_name.call("Oscar", "Fabra")