def fibonacci(n)
  n <= 1 ? n : fibonacci(n - 1) + fibonacci(n - 2)
end

puts "fibonacci(0): #{fibonacci(0)}"
puts "fibonacci(1): #{fibonacci(1)}"
puts "fibonacci(4): #{fibonacci(4)}"
puts "fibonacci(6): #{fibonacci(6)}"