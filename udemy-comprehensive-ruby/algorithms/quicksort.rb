class Array  # Overcharge the Array class

  # Method that sorts the array in increasing order using quicksort
  def quicksort
    return [] if empty?

    # [34, 2, 1, 5, 3]
    # [34, 2, 5, 3]
    # left = [34, 2]
    # right = [5, 3]

    pivot = delete_at(rand(size))  # Pulls a random pivot from the array
    left, right = partition(&pivot.method(:>))

    return *left.quicksort, pivot, *right.quicksort
  end
end

a = [34, 2, 1, 5, 3]
p a.quicksort