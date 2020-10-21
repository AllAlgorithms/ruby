# A Ruby implementation of the Bucket Sort algorithm

require "pp"

def bucket_sort(unsorted_array)
  # Display unsorted array
  puts "Unsorted array"
  pp unsorted_array
  puts "\n"

  # Create empty buckets
  buckets = bead_grid = Array.new(unsorted_array.length) { Array.new }

  # Put array elements in buckets
  unsorted_array.each_with_index do |value, index|
    bucket_index = unsorted_array.size * value
    buckets[bucket_index].append(value)
  end

  # Display buckets
  puts "Buckets to be sorted"
  pp buckets
  puts "\n"

  # Sort individual buckets
  buckets.each do |value|
    value.sort!
  end

  # Flatten buckets into one array
  sorted_array = buckets.flatten

  # Display sorted array
  puts "Sorted array"
  pp sorted_array
  puts "\n"

  # Return sorted_array
  sorted_array
end

# Testing the algorithm
array = [0.65, 0.22, 0.05, 0.17]
bucket_sort(array)

# Output
#
# Unsorted array
# [0.65, 0.22, 0.05, 0.17]
#
# Buckets to be sorted
# [[0.22, 0.05, 0.17], [], [0.65], []]
#
# Sorted array
# [0.05, 0.17, 0.22, 0.65]
#
