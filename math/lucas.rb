number = gets.chomp.to_i

def lucas(number)
  case number
  when 1 then 2
  when 2 then 1
  else lucas(number - 1) + lucas(number - 2)
  end
end

puts lucas(number)
