# Map
# arr = ["1", "23.0", "0", "4"].map { |x| x.to_i }
# p arr

# arr = ["1", "23.0", "0", "4"].map(&:to_i)
# p arr

# arr = ("a".."h").to_a.map{ |i| i * 2 }
# p arr

# h = Hash[[1, 2.1, 3.33, 0.9].map{ |x| [x.to_i, x]}]
# p h

# h = Hash[%w(A dynamic open source programming language).map { |x| [x, x.length]}]
# p h

# Taking variables and putting them into a url-friendly string
s = {:a => "foo", :b => "bar", :lat => "120.343", :long => "33.212"}.map { |a, b| "#{a}=#{b}"}.join('&')
p s