class Queue

  class Node
    attr_accessor :next, :data

    def initialize(data)
      @data = data
    end
  end

  def enqueue(o)
    if @first.nil?
      @last = Node.new(o)
      @first = @last
    else
      @last.next = Node.new(o)
      @last = @last.next
    end
  end

  def dequeue
    unless @first.nil?
      node = @first
      @first = @first.next
      @last = nil if @first.nil?
      node.data
    end
  end

end

queue = Queue.new
queue.enqueue("Test string")
queue.enqueue(:test_symbol)
queue.enqueue([1, 2, 3])
string = queue.dequeue
symbol = queue.dequeue
list = queue.dequeue

puts "String #{string}"
puts "Symbol #{symbol}"
puts "List: #{list}"