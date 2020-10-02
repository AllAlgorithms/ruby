value_one = gets.chomp.to_i
value_two = gets.chomp.to_i

def gcd(first, second)
  if second != 0
    gcd(second, first%second)
  else
    first
  end
end

puts "The greatest common divisor is #{gcd(value_one, value_two)}"
