# A Ruby implementation of Linear Search

def linear_search(element, array)
  element_index = nil

  array.each_with_index do |value, index|
   if value == element
     element_index = index
   end
  end

  element_index
end

# Testing the search
array = [5, 2, 0, 4, 1]
element = 4

result = linear_search(element, array)
puts result ? "Element present in array at index: #{result}" : "Element not present in array."

# Output
#
# Element present in array at index: 3
