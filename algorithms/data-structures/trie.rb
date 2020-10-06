# frozen_string_literal: true

class Trie
  # root of the trie
  @@root = {
    ending: 0, # counter to keep track of how many strings are ending at that poing
    nodes: {} # hash of containing nodes
  }

  # method to insert string in the trie
  def insert(string)
    temp = @@root

    # traverse string char by char because order matters in trie
    string.each_char do |char|
      # if node is not present in trie then create a new node for that char otherwise juse do nothing
      if temp[:nodes][char].nil?
        temp[:nodes][char] = {
          ending: 0,
          nodes: {}
        }
      end
      # update the node to next node
      temp = temp[:nodes][char]
    end
    # finally make the ending +1 with means this string ending here
    temp[:ending] += 1
  end

  def search(string)
    temp = @@root

    # traverse string char by char because order matters in trie
    string.each_char do |char|
      # return false if any of sequential char isn't present
      return false if temp[:nodes][char].nil?

      temp = temp[:nodes][char]
    end

    # if ending is > 0 which means string is ending here, which mean string present in trie
    (temp[:ending]).positive?
  end

  def show
    puts @@root
  end
end

t = Trie.new
t.insert('Hello World!')
# will print the whole trie structure
t.show
t.search('Hello World!')
t.search('Hello')
t.insert('Hell')
t.search('Hello')
