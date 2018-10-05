# Sorts an array a in increasing order
def mergesort(a)
  if a.length <= 1
    a
  else
    mid = (a.length / 2).floor  # Finds the middle index
    left = mergesort(a[0..mid - 1])
    right = mergesort(a[mid..a.length])
    merge(left, right)  # Merges the two halves and returns the sorted array
  end
end

# Merges two sorted arrays, left and right
def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

a = [4, 5, 8, 6, 2, 4, 5, 9]
p mergesort(a)