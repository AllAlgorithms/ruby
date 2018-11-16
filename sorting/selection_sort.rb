def selection_sort(arr)
  for j in 0..arr.count - 2 do
    i_min = j
    for i in j..arr.count - 1 do
      if arr[i] < arr[i_min]
        i_min = i
      end
    end
    if i_min != j
      arr[j], arr[i_min] = arr[i_min], arr[j]
    end
  end
  arr
end
