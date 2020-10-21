# A Ruby implementation of the Bead Sort algorithm
#
# "I" represents empty space in the bead grid
# "O" represents a bead in the bead grid

require "pp"

def bead_sort(unsorted_array)
  # Display unsorted array
  puts "Unsorted array"
  pp unsorted_array
  puts "\n"

  # Fill bead grid with values
  bead_grid = Array.new(unsorted_array.length) { Array.new(unsorted_array.max, "I") }
  unsorted_array.each_with_index do |value, index|
    while value > 0
      value = value - 1
      bead_grid[index][value] = "O"
    end
  end

  # Display initial bead grid
  puts "Initial bead grid"
  pp bead_grid
  puts "\n"

  # Let "gravity" sort the bead grid
  bead_grid = bead_grid.transpose
  bead_grid.each do |value|
    value.sort!
  end
  bead_grid = bead_grid.transpose

  # Display resulting bead grid
  puts "Resulting bead grid"
  pp bead_grid
  puts "\n"

  # Count beads to get sorted array
  sorted_array = []
  bead_grid.each do |value|
    sorted_array.append(value.count("O"))
  end

  # Display sorted array
  puts "Sorted array"
  pp sorted_array
  puts "\n"

  # Return sorted array
  sorted_array
end

# Testing the algorithm
array = [5, 2, 0, 1]
bead_sort(array)

# Output
#
# Unsorted array
# [5, 2, 0, 1]
#
# Initial bead grid
# [["O", "O", "O", "O", "O"],
#  ["O", "O", "I", "I", "I"],
#  ["I", "I", "I", "I", "I"],
#  ["O", "I", "I", "I", "I"]]
#
# Resulting bead grid
# [["I", "I", "I", "I", "I"],
#  ["O", "I", "I", "I", "I"],
#  ["O", "O", "I", "I", "I"],
#  ["O", "O", "O", "O", "O"]]
#
# Sorted array
# [0, 1, 2, 5]
#
