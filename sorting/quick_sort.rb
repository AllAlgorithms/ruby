def quick_sort(array)
  groups = array.group_by { |f| f <=> array.first }
  less_than    = groups[-1] || []
  first        = groups[0]  || []
  greater_than = groups[1]  || []

  quick_sort(less_than) + first + quick_sort(greater_than)
end