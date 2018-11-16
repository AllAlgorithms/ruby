def gcd(num1, num2)
	num1 == 0 ? num2 : gdc(num2%num1, num1)
end

puts "GCD(10,15) =  #{gcd(10,15)}"