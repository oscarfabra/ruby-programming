def bubble_sort(a)
  n = a.length
  
  while (n > 1)
    # Example of first iteration, the biggest number ends in last position
    # So each time we need to sort until one position less
    # [4, 3, 5, 2, 1, 3, 5, 4]
    # [3, 4, 5, 2, 1, 3, 5, 4]
    # [3, 4, 5, 2, 1, 3, 5, 4]
    # [3, 4, 2, 5, 1, 3, 5, 4]
    # [3, 4, 2, 1, 5, 3, 5, 4]
    # [3, 4, 2, 1, 3, 5, 5, 4]
    # [3, 4, 2, 1, 3, 5, 5, 4]
    # [3, 4, 2, 1, 3, 5, 4, 5]

    (n - 1).times do |i|
      if a[i] > a[i + 1]
        a[i], a[i + 1] = a[i + 1], a[i]
      end
    end

    n -= 1
  end # Ends while

  a
end # Ends bubble_sort method

a = [4, 3, 5, 2, 1, 3, 5, 4]
p bubble_sort a