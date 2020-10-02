# Ruby implementation of merge sort
#
# Author: Tae Noppakun Wongsrinoppakun

def merge(left, right)
  result = []
  left_index, right_index = 0, 0
  while (left_index < left.length && right_index < right.length)
    left_element = left[left_index]
    right_element = right[right_index]

    if left_element <= right_element
      result << left_element
      left_index += 1
    else
      result << right_element
      right_index += 1
    end
  end

  # add whatever is left from the left or right to the result
  if left
    result += left[left_index..-1]
  end
  if right
    result += right[right_index..-1]
  end

  return result
end

def merge_sort(m)
  if m.length <= 1
    return m
  end

  middle = m.length / 2
  left = m[0...middle]
  right = m[middle..-1]
  left = merge_sort(left)
  right = merge_sort(right)
  return merge(left, right)
end