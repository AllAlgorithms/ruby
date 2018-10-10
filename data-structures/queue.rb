class Queue

  class Node
    attr_accessor :next, :data

    def initialize(data)
      @data = data
    end
  end

  def pop
    unless @front.nil?
      popped = @front.data
      @front = @front.next
      popped
    end
  end

  def push(obj)
    if @rear.nil?
      @rear = @front = Node.new(obj)
    else
      new = @rear.next = Node.new(obj)
      @rear = new
    end
  end

  def peek
    @front.data if @front
  end

end

q = Queue.new
q.push 1
q.push 2
puts q.peek
q.push 3
q.push 4
puts q.pop
q.push 5
q.push 6
puts q.pop

puts q.peek
