# A Ruby implementation of the Counting Sort algorithm

require "pp"

def counting_sort(unsorted_array)
  # Display unsorted array
  puts "Unsorted array"
  pp unsorted_array
  puts "\n"

  range = unsorted_array.max + 1
  count_array = Array.new(range, 0)
  sorted_array = Array.new(unsorted_array.length, nil)

  # Count objects and store in matching index
  unsorted_array.each do |value|
    count_array[value] = unsorted_array.count(value)
  end

  # Display count array
  puts "Array elements counted and stored in index"
  pp count_array
  puts "\n"

  # Update each array element to contain sum of previous elements
  count_array.each_with_index do |value, index|
    count_array[index] = count_array[index] + count_array[index - 1]
  end

  # Display count array
  puts "Index previous elements summed"
  pp count_array
  puts "\n"

  # Update count array to include actual position of element in sorted array
  counter = 1
  while counter < range
    count_array[counter] = count_array[counter] + count_array[counter - 1]
    counter = counter + 1
  end

  # Build sorted array
  counter = unsorted_array.length - 1
  while counter >= 0
    sorted_array[count_array[unsorted_array[counter]] - 1] = unsorted_array[counter]
    count_array[unsorted_array[counter]] = count_array[unsorted_array[counter]] - 1
    counter = counter - 1
  end

  # Remove nil values from array
  sorted_array.compact!

  # Display sorted array
  puts "Sorted array"
  pp sorted_array
  puts "\n"

  # Return sorted array
  sorted_array
end

# Testing the algorithm
array = [7, 3, 2, 3, 1, 5, 3, 8, 7]
counting_sort(array)

# Output
#
# Unsorted array
# [7, 3, 2, 3, 1, 5, 3, 8, 7]
#
# Array elements counted and stored in index
# [0, 1, 1, 3, 0, 1, 0, 2, 1]
#
# Index previous elements summed
# [1, 2, 3, 6, 6, 7, 7, 9, 10]
#
# Sorted array
# [1, 2, 3, 3, 3, 5, 7, 7, 8]
#
