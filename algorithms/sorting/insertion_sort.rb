def insertion_sort(array)
  result = [array.shift]
  for n in array
    index = 0
    while index < result.length
      if n <= result[index]
        result.insert(index, n)
        break
      elsif index == result.length - 1
        result.insert(index + 1, n)
        break
      end
      index+=1
    end
  end
  result
end
