# Given a linked list, can you find the nth element from the end
#
class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  attr_accessor :head
  
  def initialize
    @head = nil
  end

  # Inserts the element at the front of the list.
  def push(node)
    new_node = Node.new(node)
    new_node.next = @head
    @head = new_node
  end

  # Removes and returns the first element of the list.
  def pop
    temp = @head
    return nil if temp.nil?
    @head = temp.next
    temp.data
  end

  def remove(node)
    # Store head node
    temp = @head

    # If head node itself holds the key to be deleted
    unless temp.nil?
      if temp.data == node
        @head = temp.next
        return
       end
    end

    # Search for the key to be deleted, keep track of the
    # previous node as we need to change 'prev.next'
    until temp.nil?
      break if temp.data == node
      prev = temp
      temp = temp.next
    end

    # if key was not present in linked list
    return if temp.nil?

    # Unlink the node from linked list
    prev.next = temp.next
  end
end

list = LinkedList.new
list.push(12)
list.push(15)
list.push(10)
list.push(11)
list.push(5)
list.push(6)
list.push(2)
list.push(3)
p list
list.pop
p list
