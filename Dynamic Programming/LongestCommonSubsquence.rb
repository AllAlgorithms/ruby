require 'matrix'

def max arg1, arg2
  arg1 > arg2 ? arg1 : arg2
end
# Dp using a hash
def lcs str1, str2, ptr1, ptr2, hash
  if (ptr1 < 0 || ptr2 < 0) 
    return 0 
  end
  if hash[[ptr1, ptr2]] == -1
    result = -1
    if str1[ptr1] == str2[ptr2]
      result = 1 + lcs(str1, str2, ptr1 - 1, ptr2 - 1, hash) 
    else
      result =  max(lcs(str1, str2, ptr1 - 1, ptr2, hash), lcs(str1, str2, ptr1, ptr2 - 1, hash))
    end
    hash[[ptr1, ptr2]] = result
  else
    result = hash[[ptr1, ptr2]]
  end
    return result
end

print "Enter The Two Strings\n"

str1 = gets.chomp
str2 = gets.chomp
hash = Hash.new(-1)
puts lcs(str1, str2, str1.length - 1, str2.length - 1, hash)