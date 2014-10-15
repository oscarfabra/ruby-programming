# Boolean Practice

# true
puts true && true

# false
puts false && true

# false
puts 1 == 1 && 2 == 1

# true
puts "test" == "test"

# true
puts 1 == 1 || 2 != 1

# true
puts true && 1 == 1

# false
puts false && 0 != 0

# true
puts true || 1 == 1

# false
puts "test" == "testing"

# false
puts 1 != 0 && 2 == 1

# true
puts "test" != "testing"

# false
puts "test" == 1

# true
puts !(true && false)

# false
puts !(1 == 1 && 0 != 1)

# false
puts !( 10 == 1 || 1000 == 1000)

# false
puts !( 1 != 10 || 3 == 4)

# true
puts !("testing" == "testing" && "Zed" == "Cool Guy")

# true
puts 1 == 1 && (!("testing" == 1 || 1 == 0))

# false
puts "chunky" == "bacon" && (!(3 == 4 || 3 == 3))

# false
puts 3 == 3 && (!("testing" == "testing" || "Ruby" == "Fun"))