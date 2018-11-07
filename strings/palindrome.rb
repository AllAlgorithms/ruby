def is_palindrome?(word, first_half = '', second_half = '')
  if word.length == 0 || word.length == 1
    return first_half == second_half
  end

  first_half += word.slice!(0)
  second_half += word.slice!(-1)

  is_palindrome?(word, first_half, second_half)
end

# palindromes
raise 'This is a palindrome' unless is_palindrome?('a')
raise 'this is a palindrome' unless is_palindrome?('racecar')
raise 'this is a palindrome' unless is_palindrome?('abcddcba')

# not palindromes
raise 'this is not a palindrome' if is_palindrome?('abdcd')
raise 'this is not a palindrome' if is_palindrome?('aalflkjad')
raise 'this is not a palindrome' if is_palindrome?('abcdefdcba')
