class Prime
  def sieves(n)
    primes = Array.new(n+1,true)
    primes[0] = primes[1] = false
    (0..n).each do |i|
      if primes[i]
        l = i * 2
        (l..n).step(i).each do |k|
          primes[k] = false
        end
      end
    end
    primes.collect.with_index{|prime,i| prime ? i : nil}.compact
  end
end

Prime.new.sieves(10)
Prime.new.sieves(20)
Prime.new.sieves(10000000)
