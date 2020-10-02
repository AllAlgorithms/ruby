#!/usr/bin/env ruby

alphabet = "abcdefghijlmnopqrstuvwxyz".upcase

def vetorize(text)
    listText = []
    text.each_char{|c| listText << c}
    return listText
end

def normalizeMessage(text)
    newText = []
    text = text.upcase
    text = text.gsub(" ", "")
    text = text.gsub(".", "")
    text = text.gsub(",", "")
    pos = 0
    while pos < text.length - 1
        firstLetter = text[pos]
        secondLetter = text[pos + 1]
        if firstLetter == secondLetter
            if firstLetter == "X"
                newText << firstLetter
                newText << "Z"
                pos += 1
            else
                newText << firstLetter
                newText << "X"
                pos += 1
            end
        else
            newText << firstLetter
            newText << secondLetter
            pos += 2
        end
    end
    if pos < text.length
        if text[-1] == "X"
            newText << text[pos]
            newText << "Z"
        else
            newText << text[pos]
            newText << "X"
        end
    end
    return newText
end

def createMatrix()
    matrix = []
    5.times do
        matrix << []
    end
    return matrix
end

def mountGrid(matrix, key, alphabet)
  alphabet = vetorize(alphabet)
  line, column, pos = 0, 0, 0
  key.split("").each do |letter|
      line = pos / 5
      column = pos % 5
      if alphabet.include?(letter)
          alphabet.remove(letter)
          matrix[line][column] = letter
          pos += 1
      end
  end
  while alphabet.length > 0
      line = pos / 5
      column = pos % 5
      matrix[line][column] = alphabet.shift
      pos += 1
  end
  return matrix
end

def getIndex(letter, matrix)
    for i in (0...5)
        for j in (0...5)
            if matrix[i][j] == letter
                return [i, j]
            end
        end
    end
end

def encrypt(message, key, alphabet)
  message = message.upcase
  matrix = mountGrid(createMatrix(), key, alphabet)
  message = normalizeMessage(message)
  messageEncrypted = ""
  pos, line, column = 0, 0, 1
  while pos < message.length - 1
      firstLetter = message[pos]
      secondLetter = message[pos + 1]
      indexFirstLetter = getIndex(firstLetter, matrix)
      indexSecondLetter = getIndex(secondLetter, matrix)
      if indexFirstLetter[line] == indexSecondLetter[line]
          messageEncrypted += matrix[indexFirstLetter[line]][(indexFirstLetter[column] + 1) % 5]
          messageEncrypted += matrix[indexSecondLetter[line]][(indexSecondLetter[column] + 1) % 5]
      elsif indexFirstLetter[column] == indexSecondLetter[column]
          messageEncrypted += matrix[(indexFirstLetter[line] + 1) % 5][indexFirstLetter[column]]
          messageEncrypted += matrix[(indexSecondLetter[line] + 1) % 5][indexSecondLetter[column]]
      else
          messageEncrypted += matrix[indexFirstLetter[line]][indexSecondLetter[column]]
          messageEncrypted += matrix[indexSecondLetter[line]][indexFirstLetter[column]]
      end
      pos += 2
  end
  return messageEncrypted
end

def decrypt(messageEncrypted, key, alphabet)
  messageEncrypted = messageEncrypted.upcase
  matrix = mountGrid(createMatrix(), key, alphabet)
  messageDecrypted = ""
  pos, line, column = 0, 0, 1
  while pos < messageEncrypted.length
      firstLetter = messageEncrypted[pos]
      secondLetter = messageEncrypted[pos + 1]
      indexFirstLetter = getIndex(firstLetter, matrix)
      indexSecondLetter = getIndex(secondLetter, matrix)
      if indexFirstLetter[line] == indexSecondLetter[line]
          messageDecrypted += matrix[indexFirstLetter[line]][(indexFirstLetter[column] - 1) % 5]
          messageDecrypted += matrix[indexSecondLetter[line]][(indexSecondLetter[column] - 1) % 5]
      elsif indexFirstLetter[column] == indexSecondLetter[column]
          messageDecrypted += matrix[(indexFirstLetter[line] - 1) % 5][indexFirstLetter[column]]
          messageDecrypted += matrix[(indexSecondLetter[line] - 1) % 5][indexSecondLetter[column]]
      else
          messageDecrypted += matrix[indexFirstLetter[line]][indexSecondLetter[column]]
          messageDecrypted += matrix[indexSecondLetter[line]][indexFirstLetter[column]]
      end
      pos += 2
  end
  return messageDecrypted
end

alphabet = "abcdefghijlmnopqrstuvwxyz".upcase
puts encrypt("insert your text", "test", alphabet)
puts decrypt("insert your text", "test", alphabet)