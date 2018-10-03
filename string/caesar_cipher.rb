def caesar_cipher(string)
  alphabet   = Array('a'..'z')
  encrypter  = Hash[alphabet.zip(alphabet.rotate(1))]
  string.chars.map { |c| encrypter.fetch(c, " ") }
end

p 'Enter the word you want to be encrypted:'
p caesar_cipher(gets.chomp).join
