def binary_search(element, arr)
  middle = arr[arr.length / 2]
  
  if middle == element
    return true
  elsif middle < element
    beg = middle
    last = arr.length - 1
    middle = beg + last / 2
  else
    beg = 0
    last = middle
    middle = beg + last / 2
  end
end 