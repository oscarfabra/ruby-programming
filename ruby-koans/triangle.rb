# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
	begin
		if a == 0 || b == 0 || c == 0
			raise TriangleError, "All sides must be greater than 0."
		elsif a < 0 || b < 0 || c < 0
			raise TriangleError, "Sides cannot be negative."
		else
			unless a == b && b == c
				# Finds biggest of sides
				h = [a, b, c].max
				if (h == a && (b + c <= a)) || (h == b && (a + c <= b)) ||
						(h == c && (a + b <= c))
					raise TriangleError, 
					"Hypotenuse must be bigger than the sum of the two other sides."
				end
			end
		end
	rescue StandardError => ex
		# Throws exception to method
		raise ex.class, ex.message
	end
	# Proceeds with valid values
  if a == b && b == c
  	:equilateral
  elsif a == b || b == c || a == c
  	:isosceles
  else
  	:scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
