# Argument Count
# full_name = lambda { |first, last| first + " " + last }
# p full_name.call("Oscar", "Fabra")

# full_name = Proc.new { |first, last| first + " " + last }
# p full_name.call("Oscar", "Javier", "Fabra")

# Return behavior
# def my_method
#   x = lambda { return }
#   x.call
#   p "Text from within the method"
# end

# my_method

def my_method
  x = Proc.new { return }
  x.call
  p "Text from within the method"
end

my_method