# Find the square root of an integer

def rounded_sqrt(number)
  return number if number == 0 || number == 1

  result = 1
  counter = 1
  while result <= number
    counter += 1
    result = counter ** 2
  end

  return counter - 1
end

puts rounded_sqrt(4)
puts rounded_sqrt(16)
puts rounded_sqrt(121)
