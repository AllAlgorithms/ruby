# Author: Murilo Ferreira


# Swap two elements of an array
def swap(arr, x, y)
  aux = arr[x]
  arr[x] = arr[y]
  arr[y] = aux
  nil
end

def partition(arr, a, b, x)
  m = a - 1
  for k in a..b do
    if arr[k] <= x
      m += 1
      swap(arr, m, k)
    end
  end
  m
end

def quick_sort(arr, a, b)
  return arr if a >= b  
  pivot = partition arr, a, b, arr[b]
  quick_sort arr, a, pivot-1
  quick_sort arr, pivot+1, b
  arr
end


test_array = [3,1,-10,8,10,4]
quick_sort test_array, 0, test_array.size-1
puts test_array