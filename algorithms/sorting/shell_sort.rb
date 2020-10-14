# Ruby implementation of shell sort
#
# See: http://www.codecodex.com/wiki/Shell_sort

def shellSort(array)
  inc = array.size / 2
  while inc > 0
    inc.upto(array.size - 1) { |i|
      j = i
      temp = array[i]
      while j >= inc and array[j - inc] > temp
        array[j] = array[j - inc]
        j -= inc
      end
      array[j] = temp
    }
    inc = (inc == 2 ? 1 : inc * 10 / 22)
  end
  array
end

# Test
arr = [46, 24, 33, 10, 2, 81, -50]
puts("Unsorted array")
p arr

puts("Sorted array")
p shellSort(arr)