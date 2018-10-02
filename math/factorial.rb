def factorial(n)
  (1..n).reduce(:*) || 1
end

puts "factorial(0): #{factorial(0)}"
puts "factorial(1): #{factorial(1)}"
puts "factorial(2): #{factorial(2)}"
puts "factorial(5): #{factorial(5)}"