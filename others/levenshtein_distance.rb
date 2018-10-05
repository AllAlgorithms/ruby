# Source: https://devnull.absolventa.de/2015/11/24/exploring-levenshtein-algorithm-with-ruby/
# https://rosettacode.org/wiki/Levenshtein_distance#Ruby
# In information theory, linguistics and computer science, the Levenshtein distance is a string 
# metric for measuring the difference between two sequences. Informally, the Levenshtein distance
# between two words is the minimum number of single-character edits (insertions, deletions or substitutions)
# required to change one word into the other. It is named after the Soviet mathematician Vladimir Levenshtein,
# who considered this distance in 1965. source: https://en.wikipedia.org/wiki/Levenshtein_distance
module Levenshtein
  def self.distance(a, b)
    a, b = a.downcase, b.downcase
    costs = Array(0..b.length) # i == 0
    (1..a.length).each do |i|
      costs[0], nw = i, i - 1  # j == 0; nw is lev(i-1, j)
      (1..b.length).each do |j|
        costs[j], nw = [costs[j] + 1, costs[j-1] + 1, a[i-1] == b[j-1] ? nw : nw + 1].min, costs[j]
      end
    end
    costs[b.length]
  end
end

# Example:
# Just copy the code above into your irb console
# Levenshtein.distance("hello", "hallo")  #=> 1
# Levenshtein.distance("aabb", "aaaa") #=> 2
