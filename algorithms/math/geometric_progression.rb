def geometric_progression initial, ratio, numbers
    (numbers - 1).times.inject([initial]){|array| array << array.last * ratio}
end

puts "geometric_progression(2, 2, 10): #{geometric_progression(2, 2, 10)}"
puts "geometric_progression(2, 0.5, 10): #{geometric_progression(2, 0.5, 10)}"
