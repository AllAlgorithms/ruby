# Ruby implementation of bogo sort
#
# Author: Matthias Kranzer
def bogoSort(array)
    array.shuffle! until sorted(array)
    array
end

def sorted(array)
    (0..array.length-2).all? {|i| array[i] <= array[i+1]}
end

# Test
arr = [46, 24, 33, 10, 2, 81, -50]
puts("Unsorted array")
p arr

puts("Sorted array")
p bogoSort(arr)