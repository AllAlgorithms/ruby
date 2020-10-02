def catalan(n)
  return 1 if n == 0
  2*(2*n - 1) * catalan(n-1) / (n+1)
end

for j in 0..10
  puts "#{catalan(j)} "
end
